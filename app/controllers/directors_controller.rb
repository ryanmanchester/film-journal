class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    respond_to do |f|
      f.html
      f.json {render json: @directors}
    end
  end

  def show
    @director = Director.find(params[:id])
    respond_to do |f|
      f.html
      f.json {render json: @director}
    end
  end
end
