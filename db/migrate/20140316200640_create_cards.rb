class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :cardType
      t.string :text
      t.integer :numAnswers
      t.string :expansion

      t.timestamps
    end
  end
end