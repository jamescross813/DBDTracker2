class Killer < ActiveRecord::Base
    has_many :user_killer_perks
    has_many :perks, through: :user_killer_perks
    
    has_many :users, through: :user_killer_perks
        
end