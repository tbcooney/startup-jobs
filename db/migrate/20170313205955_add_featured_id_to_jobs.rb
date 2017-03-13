class AddFeaturedIdToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :featured_id, :integer
  end
end
