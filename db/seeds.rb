# Using CSV Files import Race data
# require 'csv'

# csv_text = File.read("/Users/angelina/Documents/Agile/DataProject/race.csv")
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

# csv.each do |race|
#   Race.create(
#     id: race['ID'],
#     name: race['Name'],
#     description: race['Description'],
#     faction: race['Faction'],
#     media_url: race['Media_URL']
#   )
# end

# Using API import PlayerClass Data
require 'faraday'
require 'faraday_middleware'
require 'json'

# Use access_token to set up Faraday connection
def setup_api_client(access_token)
  Faraday.new(url: 'https://us.api.blizzard.com') do |faraday|
    faraday.response :json
    faraday.adapter Faraday.default_adapter
    faraday.params['access_token'] = access_token
    faraday.params['namespace'] = 'static-10.2.5_52554-us'
    faraday.params['locale'] = 'en_US'
  end
end

# Create a player_class data import function
# def import_classes(api_client)
#   # Initiate a request to get all classes
#   response = api_client.get('/data/wow/playable-class/index')

#   if response.success?
#     # Parse the class list
#     classes = response.body['classes']

#     # Traverse the class list and initiate a detailed information request for each class
#     classes.each do |class_summary|
#       class_detail_response = api_client.get(class_summary['key']['href'])
#       if class_detail_response.success?
#         class_detail = class_detail_response.body

#         # Create class records into the database
#         PlayerClass.create(
#           id: class_detail['id'],
#           name: class_detail['name'],
#           power_type: class_detail['power_type']['name']
#         )
#       end
#     end
#   else
#     puts "Failed to fetch classes: #{response.status}"
#   end
# end

# Create a specialization data import function
# def import_specialization(api_client)
#   # Initiate a request to get all specialization
#   response = api_client.get('/data/wow/playable-specialization/index')

#   if response.success?
#     # Parse the specialization list
#     specializations = response.body["character_specializations"]

#     # Traverse the specialization list and initiate a detailed information request for each one
#     specializations.each do |specialization|
#       specialization_detail_response = api_client.get(specialization['key']['href'])
#       if specialization_detail_response.success?
#         specialization_detail = specialization_detail_response.body

#         # Create specialization records into the database
#         Specialization.create(
#           id: specialization_detail['id'],
#           name: specialization_detail['name'],
#           description: specialization_detail['gender_description']['male'],
#           role: specialization_detail['role']['name'],
#           player_class_id: specialization_detail['playable_class']['id']
#         )
#       end
#     end
#   end
# end

# Create a race_class date import function
# def import_race_classes(api_client)
#   Race.find_each do |race|
#     # Get detailed information for each race from the API
#     response = api_client.get("/data/wow/playable-race/#{race.id}")

#     if response.success?
#       race_detail = response.body

#       # Traverse each class available for this race
#       race_detail['playable_classes'].each do |playable_class|
#         class_detail_response = api_client.get(playable_class['key']['href'])

#         if class_detail_response.success?
#           class_detail = class_detail_response.body
#           player_class_id = class_detail['id']

#           # Make sure the class exists in the database
#           if PlayerClass.exists?(id: player_class_id)
#             # Making connections between race and class
#             RaceClass.find_or_create_by(race_id: race.id, player_class_id: player_class_id)
#           end
#         end
#       end
#     else
#       puts "Failed to fetch race details for race ID #{race.id}: #{response.status}"
#     end
#   end
# end

access_token = 'USOwYDe2DbCEC8BHq9BcMxUIAxmDZvmmNi'

api_client = setup_api_client(access_token)
# # import_classes(api_client)
# # import_specialization(api_client)
# import_race_classes(api_client)

# Using Faker generate Hero data
# require 'faker'

# 100.times do
#   Hero.create(
#     name: Faker::Games::WorldOfWarcraft.hero,
#     race_id: Race.order('RANDOM()').first.id,
#     player_class_id: PlayerClass.order('RANDOM()').first.id,
#     quote: Faker::Games::WorldOfWarcraft.quote
#   )
# end

# Using API insert media_url into PlayerClass
PlayerClass.find_each do |player_class|
  response = api_client.get('/data/wow/playable-class/index')

  if response.success?
    # Parse the class list
    classes = response.body['classes']
    # Traverse the class list and initiate a detailed information request for each class
    classes.each do |class_summary|
      class_detail_response = api_client.get(class_summary['key']['href'])
      if class_detail_response.success?
        class_detail = class_detail_response.body['media']
        media_response = api_client.get(class_detail['key']['href'])
        if media_response.success?
          media_detail = media_response.body
          player_class.update(media_url: media_detail['assets'][0]['value'])
        end
      end
    end

  end
end
