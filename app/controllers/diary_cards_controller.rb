class DiaryCardsController < ApplicationController

    def create
        @diary_card = DiaryCard.create(diary_card_params)
        render json: @diary_card
    end

    private

    def diary_card_params
        params.require(:diary_card).permit(:user_id, :thoughts, :feelings)
    end
    
end
