class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!,only:[:new]

	def index
		@jobs = Job.where(Job.arel_table[:created_at].gteq("%D")).order("created_at DESC")
		@job_days = @jobs.group_by {|job| job.created_at.to_date }
	end

	def show
	end

	def new
		@job = current_user.jobs.build
	end

	def create
		@job = current_user.jobs.build(job_params)

		if @job.save
			redirect_to @job
		else
			render 'New'
		end
	end

	def edit
	end

	def update
		if @job.update(job_params)
			redirect_to @job
		else
			render 'Edit'
		end
	end

	def destroy
		@job.destroy
		redirect_to jobs_path
	end

	private

	def find_job
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:title, :description, :company, :url, :category_id)
	end
end
