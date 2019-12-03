class EventThread < ApplicationRecord
    belongs_to :event
    belongs_to :character
    has_many :event_posts

    def posts
        self.event_posts.map{|post|{ post: post, poster: post.character }}
    end
end
