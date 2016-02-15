class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #ROLES = %w[admin person].freeze
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
