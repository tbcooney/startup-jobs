class Job < ApplicationRecord
	is_impressionable
	belongs_to :category
	belongs_to :user

	has_attached_file :company_logo, :styles => { :thumb => "48x48>" }, :default_url => "/images/fallback_job_logo.png"
	validates_attachment_presence :company_logo
	validates_attachment_size :company_logo, :less_than => 1.megabytes
	validates_attachment_content_type :company_logo, content_type: /\Aimage\/.*\z/
end
