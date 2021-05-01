class UserKiller < ActiveRecord::Base
    belongs_to :killer
    belongs_to :user


    def self.killers
        @killer_ids = []
        self.all.each do |uk|
            if uk.user_id == uk.user_id
                @killer_ids << uk.killer_id
            end
        end
    end
end