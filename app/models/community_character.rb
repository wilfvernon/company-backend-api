class CommunityCharacter < ApplicationRecord
    belongs_to :community
    belongs_to :character
end
