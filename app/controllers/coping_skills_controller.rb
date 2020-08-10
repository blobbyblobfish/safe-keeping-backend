class CopingSkillsController < ApplicationController
    before_action :find, only: [:update, :destroy]

    def create
        @coping_skill = CopingSkill.create(coping_skill_params)
        render json: @coping_skill
    end

    def update
        @coping_skill.update(coping_skill_params)
        render json: @coping_skill
    end

    def destroy
        @coping_skill.destroy()
        render json: @coping_skill
    end

    def find
        @coping_skill = CopingSkill.find(params[:id])
        @coping_skill
    end

    private

    def coping_skill_params
        params.require(:coping_skill).permit(:user_id, :name, :description, :directions, :attempts, :successful_attempts)
    end
end
