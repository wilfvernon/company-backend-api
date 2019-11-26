class Account < ApplicationRecord
    has_many :characters

    def communities
        self.characters.map{|character|character.communities}.flatten.uniq{|community|community.id}
    end
end
