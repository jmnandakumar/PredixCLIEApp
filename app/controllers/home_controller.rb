class HomeController < ApplicationController

  def index
  	connection = ActiveRecord::Base.connection
	@results = ActiveRecord::Base.connection.tables
  end

  def list
  	Point.table_name = params[:table_name]
  	@points = Point.all
  end
  
end
