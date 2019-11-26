class Community < ApplicationRecord
    has_many :events
    has_many :community_characters
    has_many :characters, through: :community_characters

    def account_ids
        self.characters.map{|character|character.account.id}
    end
end
