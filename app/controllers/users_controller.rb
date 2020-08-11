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

            render json: {
                user: @user,
                token: token
            }

        else 
            render json: {
                error: "Error. Registration not successful."
            }
        end
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

    def update
        
    end

    def destroy
        
    end

    def find
        @user = User.find(params[:id])
    end

    private

    def create_user_params
        params.permit(:email, :first_name, :password)
    end

end
