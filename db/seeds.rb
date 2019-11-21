require 'rest-client'
require 'JSON'

response = RestClient.get("https://xivapi.com/character/18875885")
data = JSON.parse(response)["Character"]
character = {
    id: data["ID"],
    name: data["Name"],
    server: data["Server"],
    profile_image: data["Avatar"] 
}
Character.create(character)