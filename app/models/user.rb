class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #ROLES = %w[admin person].freeze
  before_save do
  self.role.gsub!(/[\[\]\"]/, "") if attribute_present?("role")
end
  devise :database_authenticatable, 
  		 :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :confirmable
end
