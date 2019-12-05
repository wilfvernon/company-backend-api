class AddSlotToEventCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :event_characters, :slot, :string
  end
end
