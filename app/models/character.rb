class Character < ApplicationRecord
    belongs_to :account
    has_many :community_characters
    has_many :communities, through: :community_characters
    has_many :event_characters
    has_many :events, through: :event_characters
end
