class UserTherapistsController < ApplicationController

    def create
        # Find user
        @user = User.find(params[:user_id])
        
        # Find therapist
        @therapist = Therapist.find_by(email: params[:email])
        
        @user_therapist = UserTherapist.create(user: @user, therapist: @therapist)
        render json: @user_therapist
    end

    private

end
