class User < ActiveRecord::Base
  rolify #:name_cname => 'user',:before_add => :before_add_method
  #user.add_role :admin
  
  ROLES= %w[admin teacher student]
  
  #def before_add_method(role)
    #user.add_role :student
    
  #end
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :std, :sec, :mob, :deleted_flag,:email, :password, 
  :password_confirmation, :remember_me,:role_id ,:role# attr_accessible :title, :body
  
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  pass= /^[0-9]{10,12}$/i
  validates :name, :presence => true, :length =>{:maximum => 25}
  validates :std, :presence => true, :length =>{:maximum => 25}
  validates :name, :presence => true, :length=>{:maximum => 25}
  #validates :username, :presence => true, :length=>{:within => 8..25}, :uniqueness => true
  validates :email, :presence => true, :format => EMAIL_REGEX
  validates :mob, :presence => true, :format => pass, :length =>{:maximum => 10}
  #alidates :password, :presence => true, :length=>{:within => 4..25}
  
end
