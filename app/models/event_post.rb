class EventPost < ApplicationRecord
    belongs_to :event_thread
    belongs_to :character
end
