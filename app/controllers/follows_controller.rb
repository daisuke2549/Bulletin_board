class FollowsController < ApplicationController
    before_action :authenticate_account!
 
    def create
      current_account.follow!(params[:account_id])
      redirect_to account_path(params[:account_id])
    end
end