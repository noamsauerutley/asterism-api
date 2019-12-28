class PlotNotesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        plot_notes = PlotNote.all
        render json: plot_notes
    end

    def show
        plot_note = PlotNote.find(params[:id])
        render json: plot_note
    end

    def create
        plot_note = PlotNote.create(plot_note_params)
        if client_has_valid_token?
        render json: plot_note
        else
        render json: { errors: plot_note.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        plot_note = PlotNote.find(params[:id])
        if plot_note.update(plot_note_params)
            render json: plot_note.to_json
        else
            render json: plot_note.errors, status: :unprocessable_entity
        end 
    end

    def destroy
        PlotNote.destroy(params[:id])
    end
    private

    def plot_note_params
        params.require(:plot_note).permit( :id, :plot_id, :text)
    end
end
