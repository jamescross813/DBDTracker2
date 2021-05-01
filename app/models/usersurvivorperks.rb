class UserSurvivorPerk < ActiveRecord::Base
    belongs_to :survivor
    belongs_to :user
    belongs_to :perk
    


    
end