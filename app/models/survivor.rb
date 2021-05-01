class Survivor < ActiveRecord::Base
    has_many :user_survivor_perks
    has_many :perks, through: :user_survivor_perks
    
    has_many :users, through: :user_survivor_perks
    
end