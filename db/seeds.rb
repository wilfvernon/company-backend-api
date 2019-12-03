require 'rest-client'
require 'JSON'

class Time
    def self.gen(hour, minute)
        Time.local(2019, "nov", 22, hour, minute, 0)
    end
end

# Account.destroy_all
# Character.destroy_all
# Content.destroy_all
# Event.destroy_all
# ContentEvent.destroy_all
# EventCharacter.destroy_all
# Community.destroy_all
# CommunityCharacter.destroy_all

# a1 = Account.create({
#     username: "smi"
# })


# response = RestClient.get("https://xivapi.com/character/18875885")
# data = JSON.parse(response)["Character"]
# character = {
#     api_id: data["ID"].to_s,
#     name: data["Name"],
#     server: data["Server"],
#     profile_image: data["Avatar"],
#     avatar: data["Portrait"],
#     account_id: a1.id ,
#     primary: true
# }
# character = Character.create(character)

# response = RestClient.get("http://xivapi.com/freecompany/9229283011365769087")
# data = JSON.parse(response)["FreeCompany"]
# company = {
#     api_id: data["ID"].to_s,
#     name: data["Name"],
#     server: data["Server"],
#     category: "FC",
#     image_base: data["Crest"][0],
#     image_mid: data["Crest"][1],
#     image_top: data["Crest"][2],
#     description: "Hey I'm Some and I like pizza"
# }
# company = Community.create(company)

# new_company = {
#     name: "bad boys",
#     server: "Cactuar",
#     category: "Static",
#     description: "We like to go raiding"
# }
# Community.create(new_company)

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

# event = {
#     name: "E3S prog",
#     start_time: Time.local(2019, 12, 22, 14, 0),
#     end_time: Time.local(2019, 12, 22, 16, 0),
#     community_id: company.id,
#     category: "Savage Raid",
#     description: "Let's go raiding",
#     icon: "https://xivapi.com/i/061000/061802.png"
# }
# e1 = Event.create(event)

# content_event = {
#     content_id: 16,
#     event_id: e1.id
# }
# ContentEvent.create(content_event)

# event_character = {
#     event_id: e1.id,
#     character_id: character.id,
#     organiser: true
# }

# EventCharacter.create(event_character)

# community_character = {
#     community_id: Community.all.first.id,
#     character_id: Character.all.last.id,
#     role: "member"
# }

# CommunityCharacter.create(community_character)

et1={
    title: "When should we raid?",
    event_id: Event.all.last.id,
    character_id: Character.all.first.id
}

et2={
    title: "Don't forget loot",
    event_id: Event.all.last.id,
    character_id: Character.all.last.id
}

et1 = EventThread.create(et1)
et2 = EventThread.create(et2)

