class TherapistsController < ApplicationController
    before_action :find, only: [:show, :update, :delete]

    def index
        @therapists = Therapist.all
        render json: @therapists
    end

    def show
        render json: @therapist
    end

    def create
        @therapist = Therapist.create(create_therapist_params)

        if @therapist.valid?
            token = encode_token({therapist_id: @therapist.id})

            render json: {
                therapist: TherapistSerializer.new(@therapist),
                token: token
            }

        else
            render json: {
                error: "Error. Registration not successful."
            }
        end
    end

    def login
        @therapist = Therapist.find_by(email: params[:email])

        if @therapist && @therapist.authenticate(params[:password])
            token = encode_token({therapist_id: @therapist.id})

            render json: {
              therapist: TherapistSerializer.new(@therapist),
              token: token
            }
    
        else
            render json: {error: "Cannot login."}
        end
    end

    def update
        @therapist.update(update_therapist_params)
        render json: @therapist
    end

    def destroy
        @therapist.destroy()
        render json: @therapist
    end

    def find
        @therapist = Therapist.find(params[:id])
    end

    private

    def create_therapist_params
        params.permit(:name, :email, :password)
    end

    def update_therapist_params
        params.require(:therapist).permit(:name, :email)
    end
    
end
