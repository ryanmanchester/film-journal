class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    respond_to do |f|
      f.html
      f.json {render json: @directors}
    end
  end
end
