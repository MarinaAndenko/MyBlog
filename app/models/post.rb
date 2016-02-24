class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :comments, as: :commentable
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 20 }
end
