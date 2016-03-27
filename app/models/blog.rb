 # encoding: utf-8
class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }

  def to_param
  	slug
  end 

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  def should_generate_new_friendly_id?
  	name_changed?
	end

end
