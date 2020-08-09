class EmergencyContactsController < ApplicationController
    before_action :find, only: [:update, :destroy]

    def create
        @emergency_contact = EmergencyContact.create(emergency_contact_params)
        render json: @emergency_contact
    end

    def update
        @emergency_contact.update(emergency_contact_params)
        render json: @emergency_contact
    end

    def destroy
        @emergency_contact.destroy()
        render json: @emergency_contact
    end

    def find
        @emergency_contact = EmergencyContact.find(params[:id])
        @emergency_contact
    end

    private

    def emergency_contact_params
        params.require(:emergency_contact).permit(:user_id, :name, :phone_number, :professional)
    end

end
