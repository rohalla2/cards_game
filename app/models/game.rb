class Game < ActiveRecord::Base
	belongs_to :creator, class_name: "Player"
	has_and_belongs_to_many :players
	validates :name, :code, presence: true
	validates :name, uniqueness: true

end
