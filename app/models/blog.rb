 # encoding: utf-8
class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
end
