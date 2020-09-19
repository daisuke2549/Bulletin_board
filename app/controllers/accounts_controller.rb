class AccountsController < ApplicationController
    def show
        @account = Account.find(params[:id])
        if @account == current_account
            redirect_to profile_path
        end
    end
end