class EventCharacterJob < ApplicationRecord
    belongs_to :job
    belongs_to :event_character
end
