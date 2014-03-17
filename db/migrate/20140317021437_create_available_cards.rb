class CreateAvailableCards < ActiveRecord::Migration
  def change
    create_table :available_cards do |t|
      t.references :card, index: true
      t.references :game, index: true

      t.timestamps
    end

    create_table :player_hands do |t|
    	t.references :player
    	t.references :card
    	t.references :game

    end

  end
end
