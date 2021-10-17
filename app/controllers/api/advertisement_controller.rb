module Api
  class AdvertisementController < ApplicationController
    before_action :authorize_access_request!
    skip_before_action :verify_authenticity_token
    before_action :set_advertisement, only: [:show,:userAds]
    before_action :find_ad, only: [:delete,:togglepublish]
    def index
    @advertisement =Advertisement.all
    render json: @advertisement, status: :ok
    end
    def show
    	render json: @advertisement, status: :ok
    end
    def userAds
      render json: @advertisement, status: :ok
    end
    def create
        @ad = Advertisement.new(title:params[:title], description: params[:description], image: params[:image], publish: params[:publish],user_id: current_user.id)
        
        if @ad.save
          render json: @ad, status: :created
        else
          render json: @ad_params, status: :unprocessable_entity
        end
    end
    def delete
        @advertisement.destroy
    end
    def togglepublish
      @advertisement.update(publish: params[:publish])
    end

    private
    def find_ad
          @advertisement = Advertisement.find(params[:id])
    end
      # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
        @advertisement =Advertisement.select{|n| n["user_id"]==current_user.id }
    end

      # Only allow a trusted parameter "white list" through.
    def ad_params
        params.permit(:title,:description,:image,:publish)
    end
  end
end