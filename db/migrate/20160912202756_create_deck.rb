class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
    	t.text :name
    	t.belongs_to :user
    	t.integer :card_count

    	t.timestamps
    end
  end
end
