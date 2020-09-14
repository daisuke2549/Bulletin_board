class ProfilesController < ApplicationController
    before_action :authenticate_account!

    def show
       @profile = current_account.profile
    end

    def edit
    end

end
