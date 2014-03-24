class ChangeCardColumnName < ActiveRecord::Migration
  def change
  	rename_column :cards, :cardType, :cardtype
  end
end
