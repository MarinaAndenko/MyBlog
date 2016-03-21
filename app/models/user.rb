class User < ActiveRecord::Base
  #has_attached_file :avatar, :path => ":rails_root/public/uploads/:attachment/:id/:filename",
  #:url => "/uploads/:attachment/:id/:filename"
  #validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  #validates_attachment_content_type :avatar, content_type: /\Aimage/
  mount_uploader :avatar, AvatarUploader
  has_many :blogs, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  enum role:  
  {
      user: 'user',
      admin: 'admin'
  }
  validates :username, presence: true, 
                       uniqueness: true
  validates :email, uniqueness: true
  devise :database_authenticatable, 
  		   :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :confirmable
  def to_param
    username
  end 
end
