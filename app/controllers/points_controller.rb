class PointsController < ApplicationController
	def index
		Point.table_name = params[:table_name]
		@tname = params[:table_name]
		@points = Point.all
	end

	def show
		@point = Point.find(params[:id])
	end

	def new
		@point = Point.new
	end

	def create
		@point = Point.new(point_params)
		if @point.save
			redirect_to :controller => "points",:action => "index", :table_name => Point.table_name ,:notice => "Point is crerated successfully" 
		else
			render "new"
		end

	end
	def edit
		@point = Point.find(params[:id])
	end

	def update
		@point = Point.find(params[:id])
		if(@point.update_attributes(point_params))
			redirect_to :controller => "points",:action => "index", :table_name => Point.table_name ,:notice => "Point is updated successfully" 
		else
			render "edit"
		end			
	end

	def destroy
	end

	private

  	def point_params
    	params.require(:point).permit(:pt_id, :pt_type, :pt_origin, :resource_id, :init_val, :alm_enable)
  	end
end
