require './lib/utils/strava'

task :get_activities => :environment do 
  api_key = ENV['STRAVA_KEY']
  url = 'https://www.strava.com/api/v3/athlete/activities'
  condition = true
  counter = 1
  while condition do
    response = RestClient.get(url + "?per_page=1&page=#{counter}", {:Authorization => "Bearer #{api_key}"})  
    activity = Activity.find_by_strava_id JSON.parse(response.body)[0]["id"]
    if activity.nil?
      payload = JSON.parse(response.body)[0]
      Activity.create({
        :strava_id => payload['id'],
        :name => payload['name'],
        :start_lat => payload['start_latitude'],
        :start_lng => payload['start_longitude'],
        :end_lat => payload['end_latlng'][0],
        :end_lng => payload['end_latlng'][1],
        :total_elevation_gain => payload['total_elevation_gain'],
        :moving_time => payload['moving_time'],
        :distance => payload['distance'],
        :summary_polyline => payload['map']['summary_polyline']
        })
      Strava.get_activity_polyline(payload['id'])
    else
      condition = false
    end
    counter += 1
  end
end

task :populate_polylines => :environment do
  activities = Activity.all
  activities.each do |activity|
    Strava.get_activity_polyline(activity.strava_id) if activity.polyline.nil?
  end
end