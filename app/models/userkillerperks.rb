class UserKillerPerk < ActiveRecord::Base
    belongs_to :killer
    belongs_to :user
    belongs_to :perk


    
end