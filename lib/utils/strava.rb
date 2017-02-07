module Strava
  API_KEY = ENV['STRAVA_KEY']
  class << self
    def get_activity_polyline(id)
      url = "https://www.strava.com/api/v3/activities/#{id}"
      response = RestClient.get(url, {:Authorization => "Bearer #{API_KEY}"})  
      activity = Activity.find_by_strava_id id
      activity.polyline = JSON.parse(response.body)['map']['polyline']
      activity.save
    end
  end
end