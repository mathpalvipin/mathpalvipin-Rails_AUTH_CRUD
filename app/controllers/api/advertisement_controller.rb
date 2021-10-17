module Api
  class AdvertisementController < ApplicationController
    before_action :set_advertisement, only: [:show, :update, :destroy]
    def index
    @advertisement =Advertisement.all
    render json: @advertisement, status: :ok
    end
    def show
    	render json: @advertisement, status: :ok
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_advertisement
        @advertisement = Advertisement.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def artist_params
        params.require(:dvertisement).permit(:name)
      end
  end
end