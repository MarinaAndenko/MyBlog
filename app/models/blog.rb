class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  validates :name, :description, presence: true

end
