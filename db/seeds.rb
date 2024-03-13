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
def import_classes(api_client)
  # Initiate a request to get all classes
  response = api_client.get('/data/wow/playable-class/index')

  if response.success?
    # Parse the class list
    classes = response.body['classes']

    # Traverse the class list and initiate a detailed information request for each race
    classes.each do |class_summary|
      class_detail_response = api_client.get(class_summary['key']['href'])
      if class_detail_response.success?
        class_detail = class_detail_response.body

        # Create class records into the database
        PlayerClass.create(
          id: class_detail['id'],
          name: class_detail['name'],
          power_type: class_detail['power_type']['name']
        )
      end
    end
  else
    puts "Failed to fetch classes: #{response.status}"
  end
end

access_token = 'USOwYDe2DbCEC8BHq9BcMxUIAxmDZvmmNi'

api_client = setup_api_client(access_token)
import_classes(api_client)
