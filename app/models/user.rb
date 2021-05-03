class User < ActiveRecord::Base
    has_secure_password
    validates_presence_of :username, :password_digest
    validates_uniqueness_of :username
    has_many :user_killers
    has_many :killers, through: :user_killers
    has_many :user_survivors
    has_many :survivors, through: :user_survivors
    
    has_many :currencies

end