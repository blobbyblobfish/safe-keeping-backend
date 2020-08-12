class UsersController < ApplicationController
    before_action :find, only: [:update, :destroy]

    def index
        render json: User.all
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.create(create_user_params)

        if @user.valid?
            token = encode_token({user_id: @user.id})
            
            # Seed users with initial tracker and coping skills
            Tracker.create(user: @user, name: "Mood")
            CopingSkill.create(user: @user, name: "Placeholder", description: "Lorem ipsum...", directions: "Step 1, 2, 3.", attempts: 0, successful_attempts: 0)
            
            render json: {
                user: UserSerializer.new(@user),
                token: token
            }

        else 
            render json: {
                error: "Error. Registration not successful."
            }
        end

    end

    def update
        @user.update(update_user_params)
        render json: @user
    end

    def destroy
        @user.destroy()
        render json: @user
    end

    def find
        @user = User.find(params[:id])
    end

    def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})

            render json: {
              user: UserSerializer.new(@user),
              token: token
            }
    
        else
            render json: {error: "Cannot login."}
        end

    end

    private

    def create_user_params
        params.permit(:email, :first_name, :password)
    end

    def update_user_params
        params.require(:user).permit(:email, :first_name)
    end
end
