class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :comments, as: :commentable, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :text, presence: true, length: { minimum: 50 }
  def to_param
  	"#{id}=#{name.tr(" ","-")}"
  end
end
