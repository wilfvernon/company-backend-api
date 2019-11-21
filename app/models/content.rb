class Content < ApplicationRecord
    has_many :content_events
    has_many :events, through: :content_events
end
