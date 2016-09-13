class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :name
    	t.integer :type
    	t.integer :card_count
    	t.belongs_to :deck

    	t.timestamps
    end
  end
end
