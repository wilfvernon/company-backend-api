class Job < ApplicationRecord
    has_many :event_character_jobs
    has_many :event_characters, through: :event_character_jobs
end
