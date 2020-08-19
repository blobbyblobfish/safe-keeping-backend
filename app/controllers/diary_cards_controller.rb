class DiaryCardsController < ApplicationController
    before_action :find, only: [:update, :destroy]

    # def index
    #     render json: DiaryCard.all
    # end

    # def show
    #     render json: @diary_card
    # end

    def create
        @diary_card = DiaryCard.create(diary_card_params)
        render json: @diary_card
    end

    def update
        # Update tracker
        if params[:diary_card_tracker_id]
            @dct_id = params[:diary_card_tracker_id]
            @diary_card_tracker = DiaryCardTracker.find(@dct_id)

            @diary_card_tracker.update({score: params[:score]})

        end
        
        #Update diary card
        @diary_card.update(diary_card_params)

        #render whole json
        render json: @diary_card
    end

    def destroy
        @diary_card.destroy()

        render json: @diary_card
    end

    def find
        @diary_card = DiaryCard.find(params[:id])

        @diary_card
    end

    private

    def diary_card_params
        params.require(:diary_card).permit(:user_id, :entry_timestamp, :thoughts, :feelings)
    end
    
end
