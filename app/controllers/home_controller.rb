class HomeController < ApplicationController

  def map_index
    @events = Event.all
    @locations = Location.all
  end

end
