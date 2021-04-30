class Killer < ActiveRecord::Base
    has_many :killer_perks
    has_many :perks, through: :killer_perks
    has_many :user_killers
    has_many :users, through: :user_killers
    

    

    
        
end