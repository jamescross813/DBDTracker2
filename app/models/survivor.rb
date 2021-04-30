class Survivor < ActiveRecord::Base
    has_many :survivor_perks
    has_many :perks, through: :survivor_perks
    has_many :user_survivors
    has_many :users, through: :user_survivors
    

    

    
   
end