document.addEventListener('DOMContentLoaded', function() {
  loadMapData();
});

function loadMapData() {
  fetch('/api/countries')
    .then(response => response.json())
    .then(countries => {
      colorizeMap(countries);
    })
    .catch(error => {
      console.error('Erreur lors du chargement des données de la carte:', error);
    });
}

function getScoreColor(score) {
  switch(score) {
    case 'A': return '#15803d'; // vert foncé - Exemplaire
    case 'B': return '#16a34a'; // vert - Très bon
    case 'C': return '#4ade80'; // vert clair - Bon
    case 'D': return '#fcd34d'; // jaune - Moyen
    case 'E': return '#f59e0b'; // orange - Insuffisant
    case 'F': return '#f97316'; // orange foncé - Médiocre
    case 'G': return '#ef4444'; // rouge - Très médiocre
    default: return '#9ca3af'; // gris - Non évalué
  }
}

function getScoreDescription(score) {
  switch(score) {
    case 'A': return 'Exemplaire';
    case 'B': return 'Très bon';
    case 'C': return 'Bon';
    case 'D': return 'Moyen';
    case 'E': return 'Insuffisant';
    case 'F': return 'Médiocre';
    case 'G': return 'Très médiocre';
    default: return 'Non évalué';
  }
}

function colorizeMap(countries) {
  const countryData = {};
  countries.forEach(country => {
    countryData[country.code] = {
      ...country,
      color: getScoreColor(country.score_letter_rating),
      description: getScoreDescription(country.score_letter_rating)
    };
  });
  
  document.querySelectorAll('.country-path').forEach(path => {
    const countryCode = path.getAttribute('data-country-code');
    const country = countryData[countryCode];
    
    if (country) {
      // Appliquer la couleur selon le score
      path.style.fill = country.color;
      
      // Ajouter les événements
      path.addEventListener('mouseenter', function(e) {
        showTooltip(e, country);
        path.style.stroke = '#000';
        path.style.strokeWidth = '2px';
      });
      
      path.addEventListener('mouseleave', function() {
        hideTooltip();
        path.style.stroke = '#fff';
        path.style.strokeWidth = '0.5px';
      });
      
      path.addEventListener('click', function() {
        window.location.href = `/countries/${country.id}`;
      });
    } else {
      // Pays non évalué
      path.style.fill = '#e5e7eb';
    }
  });
}

function showTooltip(event, country) {
  let tooltip = document.getElementById('map-tooltip');
  if (!tooltip) {
    tooltip = document.createElement('div');
    tooltip.id = 'map-tooltip';
    tooltip.className = 'absolute bg-white p-3 rounded shadow-lg border text-sm z-50';
    document.body.appendChild(tooltip);
  }
  
  tooltip.innerHTML = `
    <div class="font-bold">${country.name}</div>
    <div class="flex items-center gap-2 mt-1">
      <div class="w-4 h-4 rounded-full" style="background-color: ${country.color}"></div>
      <span>Score ${country.score_letter_rating} - ${country.description}</span>
    </div>
    <div class="text-xs text-gray-500 mt-1">Score CCPI: ${country.ccpi_score}</div>
    <div class="text-xs text-gray-500">Cliquez pour plus d'infos</div>
  `;
  
  tooltip.style.display = 'block';
  tooltip.style.left = event.pageX + 10 + 'px';
  tooltip.style.top = event.pageY - 10 + 'px';
}

function hideTooltip() {
  const tooltip = document.getElementById('map-tooltip');
  if (tooltip) {
    tooltip.style.display = 'none';
  }
}
