class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :users, through: :views 
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :text, presence: true, length: { minimum: 50 }

  def to_param
  	slug
  end 

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
  	name_changed? 
  end
end