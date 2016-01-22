class HomeController < ApplicationController
  respond_to :html, :json
  def index
  	connection = ActiveRecord::Base.connection
	@results = ActiveRecord::Base.connection.tables
  end  
end
