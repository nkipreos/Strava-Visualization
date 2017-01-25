class LandingController < ApplicationController
  def index
    @activities = Activity.all
    @latlngs = []
    @centerlat = (@activities.map {|x| x['start_lat']}.inject(:+)/@activities.count).to_f
    @centerlng = (@activities.map {|x| x['start_lng']}.inject(:+)/@activities.count).to_f
  end
end