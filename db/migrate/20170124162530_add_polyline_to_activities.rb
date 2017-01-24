class AddPolylineToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :polyline, :text
    add_column :activities, :summary_polyline, :text
  end
end
