class CommunityPost < ApplicationRecord
    belongs_to :character
    belongs_to :community_thread
end
