class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]

	def index
		@jobs = Job.all.order("created_at DESC")
	end

	def show
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)

		if @job.save
			redirect_to @job
		else
			render 'New'
		end
	end

	def update
	end

	def destroy
	end

	private

	def find_job
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:title, :description, :company, :url)
	end
end
