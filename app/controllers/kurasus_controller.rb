class KurasusController < ApplicationController
	def new
		@kurasu = Kurasu.new
	end

	def destroy
		@kurasu = Kurasu.find(params[:id])
		@kurasu.destroy

		redirect_to kurasus_path
	end

	def index
		@kurasus = Kurasu.all
	end

	def create
		@kurasu = Kurasu.new(params[:kurasu].permit(:course, :grade))

		if @kurasu.save
			redirect_to @kurasu
		else
			render 'new'
		end
	end

	def edit
		@kurasu = Kurasu.find(params[:id])
	end

	def update
		@kurasu = Kurasu.find(params[:id])

		if @kurasu.update(params[:kurasu].permit(:courses, :grade))
			redirect_to @kurasu
		else
			render 'edit'
		end
	end

	def show
		@kurasu = Kurasu.find(params[:id])
	end

	private
	   def kurasu_params
	   	   params.require(:kurasu).permit(course, :grade)
	   end
end
