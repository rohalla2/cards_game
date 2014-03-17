class Game < ActiveRecord::Base
	belongs_to :creator, class_name: "Player"
	has_and_belongs_to_many :players
	has_many :available_cards, dependent: :destroy
	has_many :cards, through: :available_cards

	validates :name, :code, presence: true
	validates :name, uniqueness: true

	before_update :prevent_reactivate
	after_update :setup_game

	private
		def prevent_reactivate
			if closed == false && closed_was == true
				write_attribute(:closed, true)
			end
		end	

		def setup_game
			if closed == true && closed_was == false
			    cards = Card.all
    			cards.each do |card|
      				if card.game.nil? || card.game == id
      					c = AvailableCard.new
      					c.card_id = card.id
      					c.game_id = id
      					c.save    			
    				end
  				end
  			end			
		end

end
