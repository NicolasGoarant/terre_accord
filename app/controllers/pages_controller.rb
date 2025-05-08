class PagesController < ApplicationController
  def methodology
    # Cette méthode sert simplement à afficher la vue
    # Pas besoin de logique spécifique pour le moment
    # Variables pour personnaliser la page
    @page_title = "Notre méthodologie d'évaluation climatique"
    @last_update = "Avril 2025" # Date de dernière mise à jour des données
    
    # Critères d'évaluation stockés dans un tableau
    @criteria = [
      { name: "Émissions de gaz à effet de serre", weight: 40, description: "Niveau actuel d'émissions, tendance de réduction et objectifs nationaux par rapport aux recommandations scientifiques." },
      { name: "Développement des énergies renouvelables", weight: 20, description: "Part actuelle des énergies renouvelables dans le mix énergétique et trajectoire de développement." },
      { name: "Efficacité énergétique", weight: 20, description: "Mesures et politiques visant à réduire la consommation d'énergie et à améliorer l'efficacité énergétique." },
      { name: "Politiques climatiques", weight: 20, description: "Qualité des politiques climatiques nationales et internationales, niveau d'ambition et mise en œuvre." }
    ]
    
    # Définir le barème des notes
    @grades = [
      { letter: "A", color: "#15803d", label: "Exemplaire", threshold: 80, description: "Le pays est sur la bonne voie pour respecter, voire dépasser, ses engagements de l'Accord de Paris." },
      { letter: "B", color: "#16a34a", label: "Très bon", threshold: 70, description: "Excellentes politiques climatiques, alignées sur l'objectif de 1,5°C." },
      { letter: "C", color: "#4ade80", label: "Bon", threshold: 60, description: "Bonnes politiques climatiques, mais des efforts supplémentaires sont nécessaires." },
      { letter: "D", color: "#fcd34d", label: "Moyen", threshold: 50, description: "Politiques climatiques modérées, insuffisantes pour l'objectif de 2°C." },
      { letter: "E", color: "#f59e0b", label: "Médiocre", threshold: 40, description: "Efforts limités, trajectoire actuelle incompatible avec l'Accord de Paris." },
      { letter: "F", color: "#f97316", label: "Insuffisant", threshold: 30, description: "Politiques climatiques très insuffisantes, peu d'actions concrètes." },
      { letter: "G", color: "#ef4444", label: "Très médiocre", threshold: 0, description: "Absence de politiques climatiques significatives, augmentation des émissions." }
    ]
    
    # Sources des données
    @sources = [
      { name: "Climate Change Performance Index", url: "https://ccpi.org/" },
      { name: "Climate Action Tracker", url: "https://climateactiontracker.org/" },
      { name: "Accord de Paris (UNFCCC)", url: "https://unfccc.int/process-and-meetings/the-paris-agreement/the-paris-agreement" }
    ]
  end
  
  def about
    # Pour une future page "À propos"
    @page_title = "À propos de Terre d'Accord"
    @team_members = [
      { name: "Nicolas Goarant", role: "Fondateur", bio: "Passionné par l'action climatique et le développement durable" },
      # Autres membres de l'équipe pourront être ajoutés ici
    ]
    @mission = "Notre mission est d'encourager un tourisme responsable en guidant les voyageurs vers des destinations engagées dans la lutte contre le changement climatique."
    @vision = "Nous aspirons à transformer l'industrie du tourisme en un levier de changement positif pour le climat, en valorisant les pays qui agissent concrètement pour respecter l'Accord de Paris."
  end
  
  def contact
    # Pour une future page "Contact"
    @page_title = "Contactez-nous"
    @contact_email = "contact@terre-accord.org"
    @social_media = {
      twitter: "https://twitter.com/terre_accord",
      facebook: "https://facebook.com/terre.accord",
      instagram: "https://instagram.com/terre_accord"
    }
    @headquarters = "Paris, France"
  end
end
