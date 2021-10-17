class HomeController < ApplicationController
  def ads
    @advertisement =Advertisement.select {|n| n["publish"]==true }
    render json: @advertisement, status: :ok
  end
  def index
  end
end
