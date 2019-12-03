class Community < ApplicationRecord
    has_many :events
    has_many :community_characters
    has_many :characters, through: :community_characters
    has_many :community_threads

    def account_ids
        self.characters.map{|character|character.account.id}
    end

    def admins
        self.community_characters.select{|cc|cc.role=="admin"}.map{|cc|cc.character}
    end

    def members
        self.community_characters.select{|cc|cc.role=="member"}.map{|cc|cc.character}
    end
end
