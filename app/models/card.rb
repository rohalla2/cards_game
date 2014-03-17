class Card < ActiveRecord::Base
	has_many :available_cards
	has_many :games, through: :available_cards
	has_many :cards_players
	has_many :players, through: :cards_players
end
