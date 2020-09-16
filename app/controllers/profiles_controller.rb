class ProfilesController < ApplicationController
    before_action :authenticate_account!

    def show
      @profile = current_account.profile
    end

    def edit
        @profile = current_account.build_profile
    end

    def update
      @profile = current_account.prepare_profile
      @profile.assign_attributes(profile_params)
      if @profile.save
        redirect_to profile_path, notice: 'プロフィール更新！'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end

    private
    def profile_params
      params.require(:profile).permit(
        :nickname,
        :introduction,
        :gender,
        :birthday,
        :subscribed,
        :avatar
      )
    end
end
