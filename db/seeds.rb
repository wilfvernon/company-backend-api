require 'rest-client'
require 'JSON'

Account.destroy_all
Character.destroy_all
# Community.destroy_all
# Content.destroy_all

a1 = Account.create({
    username: "smi"
})

response = RestClient.get("https://xivapi.com/character/18875885")
data = JSON.parse(response)["Character"]
character = {
    api_id: data["ID"].to_s,
    name: data["Name"],
    server: data["Server"],
    profile_image: data["Avatar"],
    account_id: a1.id ,
    primary: true
}
Character.create(character)

# response = RestClient.get("http://xivapi.com/freecompany/9229283011365769087")
# data = JSON.parse(response)["FreeCompany"]
# company = {
#     api_id: data["ID"].to_s,
#     name: data["Name"],
#     server: data["Server"],
#     category: "FC"
# }
# Community.create(company)

# company = {
#     name: "bad boys",
#     server: "Cactuar",
#     category: "Static"
# }
# Community.create(company)

# currentRaidIds=*(30078..30087)
# currentRaidIds.map do |id|
#     response = RestClient.get("https://xivapi.com/instanceContent/" + id.to_s)
#     data = JSON.parse(response)
#     content = {
#         name: data["ContentFinderCondition"]["Name"],
#         category: (data["ContentFinderCondition"]["HighEndDuty"] == 1 ? "Savage ": "") + "Raid",
#         image: data["Banner"],
#         minimum_level: 80,
#         minimum_ilevel: data["ContentFinderCondition"]["ItemLevelRequired"],
#         api_id: data["ID"].to_s
#     }
#     Content.create(content)
# end