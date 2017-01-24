# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
files = Dir['db/seeds/strava/*.route']

files.each do |file|
  hash = eval(File.open(file).read)
  Activity.create({
    strava_id: hash['id'],
    name: hash['name'],
    start_lat: hash['start_latlng'][0],
    start_lng: hash['start_latlng'][1],
    end_lat: hash['end_latlng'][0],
    end_lng: hash['end_latlng'][1],
    total_elevation_gain: hash['total_elevation_gain'],
    moving_time: hash['moving_time'],
    distance: hash['distance'],
    polyline: hash['map']['polyline'],
    summary_polyline: hash['map']['summary_polyline']
    })
end
