class WelcomeController < ApplicationController
  def index
	@featured_jobs = Job.where(featured_id: @featured_id.blank?).order("created_at DESC")
  end
end
