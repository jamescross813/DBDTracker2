class Helpers


    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
        @user
    end

    def self.logged_in?(session)
        !!session[:user_id]
    end

    def self.has_values?(session)
        if UserKiller.find_by(:user_id => session[:user_id])
            @userkiller = UserKiller.find_by(:user_id => session[:user_id])
             
            # KillerPerks.find_by
        end
    end

    
end