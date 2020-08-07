class DiaryCardTrackersController < ApplicationController

    def create
        @new_diary_card_tracker = DiaryCardTracker.create(diary_card_tracker_params)

        # Render whole Diary Card json to update state on frontend
        @diary_card_id = params[:diary_card_id]
        @diary_card = DiaryCard.find(@diary_card_id)

        render json: @diary_card
    end

    private

    def diary_card_tracker_params
        params.require(:diary_card_tracker).permit(:tracker_id, :diary_card_id, :score)
    end

end
