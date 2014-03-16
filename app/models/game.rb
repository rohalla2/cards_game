class Game < ActiveRecord::Base
	validates :name, :code, presence: true
	validates :name, uniqueness: true
end
