class Tweet < ActiveRecord::Base
  belongs_to :user

  has_many :likes

  validates :message, presence: true, length: { maximum: 140, 
                      too_long: "A chirp is only 140 max. Everybody knows that!" }
end
