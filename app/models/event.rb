class Event < ApplicationRecord
    belongs_to :community, optional: true
    has_many :content_events
    has_many :contents, through: :content_events
    has_many :event_characters
    has_many :characters, through: :event_characters
end
