# Supprimer les données existantes dans le bon ordre pour respecter les contraintes de clés étrangères
puts "Suppression des données existantes..."

# Vérifier et supprimer les associations avant les tables principales
begin
  if ActiveRecord::Base.connection.table_exists?(:country_activities)
    puts "Suppression des associations pays-activités..."
    ActiveRecord::Base.connection.execute("DELETE FROM country_activities")
  end
rescue => e
  puts "Note: Table country_activities non trouvée ou erreur: #{e.message}"
end

# Supprimer ensuite les tables principales
puts "Suppression des activités..."
Activity.destroy_all

puts "Suppression des pays..."
Country.destroy_all

# Créer les activités
puts "Création des activités..."
activities = [
  { name: "Plage", activity_type: "Plage", description: "Activités de plage et de bord de mer" },
  { name: "Nature", activity_type: "Nature", description: "Randonnées et activités en pleine nature" },
  { name: "Culture", activity_type: "Culture", description: "Visites de sites historiques et musées" },
  { name: "Aventure", activity_type: "Aventure", description: "Sports extrêmes et activités adrénaline" },
  { name: "Ville", activity_type: "Ville", description: "Découverte des centres urbains et shopping" }
]

activities.each do |activity_attrs|
  Activity.create!(activity_attrs)
end

# Créer les pays avec leurs scores climatiques
puts "Création des pays..."
countries = [
  {
    name: "Suède",
    code: "SE",
    continent: "Europe",
    score_letter_rating: "A",
    ccpi_score: 74.5,
    description: "La Suède est un leader mondial dans la lutte contre le changement climatique, avec un engagement fort pour les énergies renouvelables et une législation ambitieuse.",
    image_url: "https://images.unsplash.com/photo-1509356843151-3e7d96241e11?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  },
  {
    name: "Danemark",
    code: "DK",
    continent: "Europe",
    score_letter_rating: "A",
    ccpi_score: 76.8,
    description: "Le Danemark est à l'avant-garde de la transition énergétique avec un objectif de neutralité carbone d'ici 2050 et un développement massif de l'énergie éolienne.",
    image_url: "https://images.unsplash.com/photo-1513622470522-26c3c8a854bc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  },
  {
    name: "Maroc",
    code: "MA",
    continent: "Afrique",
    score_letter_rating: "B",
    ccpi_score: 67.3,
    description: "Le Maroc est un pionnier africain dans les énergies renouvelables avec le plus grand complexe solaire du monde et des politiques climatiques ambitieuses.",
    image_url: "https://images.unsplash.com/photo-1528657249085-893d5cd4d304?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1173&q=80"
  },
  {
    name: "Royaume-Uni",
    code: "GB",
    continent: "Europe",
    score_letter_rating: "B",
    ccpi_score: 63.1,
    description: "Le Royaume-Uni a considérablement réduit ses émissions de carbone en sortant progressivement du charbon et en développant l'énergie éolienne offshore.",
    image_url: "https://images.unsplash.com/photo-1486299267070-83823f5448dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80"
  },
  {
    name: "France",
    code: "FR",
    continent: "Europe",
    score_letter_rating: "C",
    ccpi_score: 56.8,
    description: "La France a une empreinte carbone relativement faible grâce à son parc nucléaire, mais doit accélérer sur les renouvelables et la rénovation énergétique.",
    image_url: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1173&q=80"
  },
  {
    name: "Allemagne",
    code: "DE",
    continent: "Europe",
    score_letter_rating: "C",
    ccpi_score: 58.2,
    description: "L'Allemagne a fait des progrès significatifs dans la production d'énergie renouvelable, mais doit accélérer sa sortie du charbon et réduire ses émissions liées aux transports.",
    image_url: "https://images.unsplash.com/photo-1599946347371-68eb71b16afc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  },
  {
    name: "Italie",
    code: "IT",
    continent: "Europe",
    score_letter_rating: "D",
    ccpi_score: 48.7,
    description: "L'Italie progresse dans le développement des énergies renouvelables mais doit renforcer ses politiques climatiques et réduire sa dépendance aux combustibles fossiles.",
    image_url: "https://images.unsplash.com/photo-1516108317508-6788f6a160e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  },
  {
    name: "Brésil",
    code: "BR",
    continent: "Amérique du Sud",
    score_letter_rating: "D",
    ccpi_score: 45.2,
    description: "Le Brésil dispose d'un mix énergétique avec une forte part de renouvelables, mais la déforestation et le recul des politiques environnementales sont préoccupants.",
    image_url: "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  },
  {
    name: "Chine",
    code: "CN",
    continent: "Asie",
    score_letter_rating: "E",
    ccpi_score: 37.9,
    description: "La Chine est le premier investisseur mondial dans les énergies renouvelables, mais reste le plus grand émetteur de CO2 avec une forte dépendance au charbon.",
    image_url: "https://images.unsplash.com/photo-1547150492-da7ff1742941?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  },
  {
    name: "Inde",
    code: "IN",
    continent: "Asie",
    score_letter_rating: "E",
    ccpi_score: 39.3,
    description: "L'Inde développe rapidement ses capacités solaires, mais continue d'ouvrir de nouvelles centrales à charbon et a des difficultés à limiter la croissance de ses émissions.",
    image_url: "https://images.unsplash.com/photo-1532664189809-02133fee698d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80"
  },
  {
    name: "Australie",
    code: "AU",
    continent: "Océanie",
    score_letter_rating: "F",
    ccpi_score: 31.6,
    description: "L'Australie dispose d'un énorme potentiel pour les énergies renouvelables, mais maintient un fort soutien à l'industrie du charbon et a des politiques climatiques insuffisantes.",
    image_url: "https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
  },
  {
    name: "Russie",
    code: "RU",
    continent: "Europe/Asie",
    score_letter_rating: "F",
    ccpi_score: 33.1,
    description: "La Russie manque d'ambition climatique et continue de promouvoir l'exploitation des combustibles fossiles, avec peu d'investissements dans les énergies renouvelables.",
    image_url: "https://images.unsplash.com/photo-1513326738677-b964603b136d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1149&q=80"
  },
  {
    name: "États-Unis",
    code: "US",
    continent: "Amérique du Nord",
    score_letter_rating: "G",
    ccpi_score: 28.4,
    description: "Malgré des progrès au niveau des états et des villes, les États-Unis ont une empreinte carbone par habitant très élevée et des politiques fédérales insuffisantes.",
    image_url: "https://images.unsplash.com/photo-1485738422979-f5c462d49f74?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80"
  },
  {
    name: "Canada",
    code: "CA",
    continent: "Amérique du Nord",
    score_letter_rating: "G",
    ccpi_score: 25.9,
    description: "Le Canada a une empreinte carbone par habitant parmi les plus élevées au monde, en partie à cause de l'exploitation des sables bitumineux et d'un climat froid.",
    image_url: "https://images.unsplash.com/photo-1503614472-8c93d56e92ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1111&q=80"
  }
]

# Créer les pays et les associer aux activités
countries.each do |country_attrs|
  country = Country.create!(country_attrs)
  
  # Associer des activités aléatoires à chaque pays
  Activity.all.sample(rand(1..3)).each do |activity|
    CountryActivity.create!(country: country, activity: activity)
  end
  
  puts "Pays créé: #{country.name} (#{country.score_letter_rating})"
end

puts "Seed terminé avec succès!"
