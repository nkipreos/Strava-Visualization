class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :strava_id
      t.string :name
      t.decimal :start_lat, {:precision=>10, :scale=>6}
      t.decimal :start_lng, {:precision=>10, :scale=>6}
      t.decimal :end_lat, {:precision=>10, :scale=>6}
      t.decimal :end_lng, {:precision=>10, :scale=>6}
      t.float :total_elevation_gain
      t.integer :moving_time
      t.float :distance

      t.timestamps
    end
  end
end
