class PlotsController < ApplicationController    
    skip_before_action :verify_authenticity_token

    def index
        plots = Plot.all
        render json: plots
    end

    def show
        plot = Plot.find(params[:id])
        render json: plot
    end

    def create
        plot = Plot.create(plot_params)
        if plot.valid?
        render json: { token: token(plot.id), plot_id: plot.id }
        
        else
        render json: { errors: plot.errors.full_messages }, status: :unprocessable_entity
        end 
    end

    def update
        plot = Plot.find(params[:id])
        if plot.update(plot_params)
            render json: plot.to_json
        else
        render json: plot.errors, status: :unprocessable_entity
        end 
        end

        def destroy
            Plot.destroy(params[:id])
        end
    private

    def plot_params
        params.require(:plot).permit(:story_id, :name, :summary)
    end
end
