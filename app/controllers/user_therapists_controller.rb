class UserTherapistsController < ApplicationController

    def create
        # Find user
        @user = User.find(params[:user_id])
        
        # Find therapist
        @therapist = Therapist.find_by(email: params[:email])
        
        @user_therapist = UserTherapist.create(user: @user, therapist: @therapist)
        render json: @user_therapist
    end

    def destroy
        # ** TO DO** Update to allow users to have multiple therapists
        @user_therapist = UserTherapist.find_by(user_id: params[:user_id])

        byebug
        
        @user_therapist.destroy()

        render json: @user_therapist
    end

end
