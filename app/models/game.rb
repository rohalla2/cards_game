class Game < ActiveRecord::Base
	belongs_to :creator, class_name: "Player"
	validates :name, :code, presence: true
	validates :name, uniqueness: true
end
