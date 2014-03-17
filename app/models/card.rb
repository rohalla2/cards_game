class Card < ActiveRecord::Base
	has_many :available_cards
	has_many :games, through: :available_cards
end
