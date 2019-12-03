class CommunityThread < ApplicationRecord
    has_many :community_posts
    belongs_to :community
    belongs_to :character

    def posts
        self.community_posts.map{|post|{ post: post, poster: post.character }}
    end

end
