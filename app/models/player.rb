class Player < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :games
  has_many :cards_players
  has_many :cards, through: :cards_players
  has_many :games_created, class_name: "Game", foreign_key: "creator_id"
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  	before_validation :downcase_email
	before_create :downcase_email
	before_save :downcase_email

	private
		def downcase_email
			self.email.downcase!
		end

end
