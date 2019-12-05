require 'rest-client'
require 'JSON'

class Time
    def self.gen(hour, minute)
        Time.local(2019, "nov", 22, hour, minute, 0)
    end
end

Account.destroy_all
Character.destroy_all
# Content.destroy_all
Event.destroy_all
ContentEvent.destroy_all
EventCharacter.destroy_all
EventCharacterJob.destroy_all
Community.destroy_all
CommunityCharacter.destroy_all
EventThread.destroy_all
EventPost.destroy_all
CommunityThread.destroy_all
CommunityPost.destroy_all



a1 = Account.create({
    username: "goose"
})


response = RestClient.get("https://xivapi.com/character/18875885")
data = JSON.parse(response)["Character"]
character = {
    api_id: data["ID"].to_s,
    name: data["Name"],
    server: data["Server"],
    profile_image: data["Avatar"],
    avatar: data["Portrait"],
    account_id: a1.id ,
    primary: true
}
character = Character.create(character)

a2 = Account.create({
    username: "some"
})

response = RestClient.get("https://xivapi.com/character/14492494")
data = JSON.parse(response)["Character"]
character2 = {
    api_id: data["ID"].to_s,
    name: data["Name"],
    server: data["Server"],
    profile_image: data["Avatar"],
    avatar: data["Portrait"],
    account_id: a2.id ,
    primary: true
}
character2 = Character.create(character2)

response = RestClient.get("http://xivapi.com/freecompany/9229283011365769087")
data = JSON.parse(response)["FreeCompany"]
company = {
    api_id: data["ID"].to_s,
    name: data["Name"],
    server: data["Server"],
    category: "FC",
    image_base: data["Crest"][0],
    image_mid: data["Crest"][1],
    image_top: data["Crest"][2],
    description: "Friendly guild for casual and hardcore content alike - active on comms and open to all"
}
company = Community.create(company)

community_character = {
    community_id: company.id,
    character_id: character2.id,
    role: "admin"
}

CommunityCharacter.create(community_character)

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

# et1={
#     title: "When should we raid?",
#     event_id: Event.all.last.id,
#     character_id: Character.all.first.id
# }

# et2={
#     title: "Don't forget loot",
#     event_id: Event.all.last.id,
#     character_id: Character.all.last.id
# }

# et1 = EventThread.create(et1)
# et2 = EventThread.create(et2)

# ct1={
#     title: "When should we raid?",
#     community_id: Community.all.first.id,
#     character_id: Character.all.first.id
# }

# ct2={
#     title: "Don't forget loot",
#     community_id: Community.all.first.id,
#     character_id: Character.all.last.id
# }

# ct1 = CommunityThread.create(ct1)
# ct2 = CommunityThread.create(ct2)

# war = {
#     name: "Warrior",
#     abv: "WAR",
#     icon: "https://ffxiv.gamerescape.com/w/images/1/16/Warrior_Icon_3.png",
#     role: "tank",
#     role_type: "tank"
# }

# war = Job.create(war)

# pld = {
#     name: "Paladin",
#     abv: "PLD",
#     icon: "https://ffxiv.gamerescape.com/w/images/6/66/Paladin_Icon_3.png",
#     role: "tank",
#     role_type: "tank"
# }

# pld = Job.create(pld)

# drk = {
#     name: "Dark Knight",
#     abv: "DRK",
#     icon: "https://ffxiv.gamerescape.com/w/images/b/bd/Dark_Knight_Icon_3.png",
#     role: "tank",
#     role_type: "tank"
# }

# drk = Job.create(drk)

# gnb = {
#     name: "Gunbreaker",
#     abv: "GNB",
#     icon: "https://ffxiv.gamerescape.com/w/images/b/b9/Gunbreaker_Icon_3.png",
#     role: "tank",
#     role_type: "tank"
# }

# gnb = Job.create(gnb)

# drg = {
#     name: "Dragoon",
#     abv: "DRG",
#     icon: "https://ffxiv.gamerescape.com/w/images/2/21/Dragoon_Icon_3.png",
#     role: "dps",
#     role_type: "melee"
# }

# drg = Job.create(drg)

# mnk = {
#     name: "Monk",
#     abv: "MNK",
#     icon: "https://ffxiv.gamerescape.com/w/images/f/f9/Monk_Icon_3.png",
#     role: "dps",
#     role_type: "melee"
# }

# mnk = Job.create(mnk)

# nin = {
#     name: "Ninja",
#     abv: "NIN",
#     icon: "https://ffxiv.gamerescape.com/w/images/c/c8/Ninja_Icon_3.png",
#     role: "dps",
#     role_type: "melee"
# }

# nin=Job.create(nin)

# sam = {
#     name: "Samurai",
#     abv: "SAM",
#     icon: "https://ffxiv.gamerescape.com/w/images/9/98/Samurai_Icon_3.png",
#     role: "dps",
#     role_type: "melee"
# }

# sam=Job.create(sam)

# brd = {
#     name: "Bard",
#     abv: "BRD",
#     icon: "https://ffxiv.gamerescape.com/w/images/b/b3/Bard_Icon_3.png",
#     role: "dps",
#     role_type: "ranged"
# }

# brd=Job.create(brd)

# mch = {
#     name: "Machinist",
#     abv: "MCH",
#     icon: "https://ffxiv.gamerescape.com/w/images/9/99/Machinist_Icon_3.png",
#     role: "dps",
#     role_type: "ranged"
# }

# mch=Job.create(mch)

# dnc = {
#     name: "Dancer",
#     abv: "DNC",
#     icon: "https://ffxiv.gamerescape.com/w/images/3/3e/Dancer_Icon_3.png",
#     role: "dps",
#     role_type: "ranged"
# }

# dnc=Job.create(dnc)

# blm = {
#     name: "Black Mage",
#     abv: "BLM",
#     icon: "https://ffxiv.gamerescape.com/w/images/5/51/Black_Mage_Icon_3.png",
#     role: "dps",
#     role_type: "magic"
# }

# blm=Job.create(blm)

# smn = {
#     name: "Summoner",
#     abv: "SMN",
#     icon: "https://ffxiv.gamerescape.com/w/images/f/f6/Summoner_Icon_3.png",
#     role: "dps",
#     role_type: "magic"
# }

# smn=Job.create(smn)

# rdm = {
#     name: "Red Mage",
#     abv: "RDM",
#     icon: "https://ffxiv.gamerescape.com/w/images/6/64/Red_Mage_Icon_3.png",
#     role: "dps",
#     role_type: "magic"
# }

# rdm=Job.create(rdm)

# whm = {
#     name: "White Mage",
#     abv: "WHM",
#     icon: "https://ffxiv.gamerescape.com/w/images/d/db/White_Mage_Icon_3.png",
#     role: "healer",
#     role_type: "healer"
# }

# whm=Job.create(whm)

# sch = {
#     name: "Scholar",
#     abv: "SCH",
#     icon: "https://ffxiv.gamerescape.com/w/images/e/e0/Scholar_Icon_3.png",
#     role: "healer",
#     role_type: "healer"
# }

# sch=Job.create(sch)

# ast = {
#     name: "Astrologian",
#     abv: "AST",
#     icon: "https://ffxiv.gamerescape.com/w/images/f/fb/Astrologian_Icon_3.png",
#     role: "healer",
#     role_type: "healer"
# }

# ast=Job.create(ast)