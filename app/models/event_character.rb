class EventCharacter < ApplicationRecord
    belongs_to :event
    belongs_to :character
    has_many :event_character_jobs
    has_many :jobs, through: :event_character_jobs
end
