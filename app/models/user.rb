class User < ActiveRecord::Base
  has_many :blogs, dependent: :destroy
  has_many :comments, as: :commentable
  enum role:  
   {
      user: 'user',
      admin: 'admin'
   }
  validates :username, presence: true, 
                       uniqueness: true
  validates :email, uniqueness: true
  #self.role.gsub!(/[\[\]\"]/, "") if attribute_present?("role")
#end
  devise :database_authenticatable, 
  		   :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :confirmable
end
