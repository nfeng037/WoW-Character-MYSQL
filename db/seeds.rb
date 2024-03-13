# Using CSV Files import Race data
require 'csv'

csv_text = File.read("/Users/angelina/Documents/Agile/DataProject/race.csv")
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |race|
  Race.create(
    id: race['ID'],
    name: race['Name'],
    description: race['Description'],
    faction: race['Faction'],
    media_url: race['Media_URL']
  )
end
