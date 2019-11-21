class EventThread < ApplicationRecord
    belongs_to :event
    has_many :event_posts
end
