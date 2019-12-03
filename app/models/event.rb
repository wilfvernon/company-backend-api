class Event < ApplicationRecord
    belongs_to :community, optional: true
    has_many :content_events
    has_many :contents, through: :content_events
    has_many :event_characters
    has_many :characters, through: :event_characters
    has_many :event_threads

    def account_ids
        self.characters.map{|character|character.account.id}
    end

    def organiser
        if org = self.event_characters.find{|ec|ec.organiser}
            org.character
        else
            "none"
        end 
    end
end
