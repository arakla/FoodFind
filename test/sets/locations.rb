module Contexts
  module Locations
    # Context for locations
    def create_locations
      @donnerDitch = FactoryGirl.create(:location, name: "Donner Ditch", latitude: 40.442212, longitude: -79.940707)
      @CFALawn = FactoryGirl.create(:location, name: "CFA Lawn", latitude: 40.441729, longitude: -79.943582)
      @theFence = FactoryGirl.create(:location, name: "The Fence", latitude: 40.442200, longitude: -79.943421)
      @rangos = FactoryGirl.create(:location, name: "Rangos Hall", latitude: 40.443507, longitude: -79.942037)
    end
    
    def destroy_locations
      @donnerDitch.delete
      @CFALawn.delete
      @theFence.delete
      @rangos.delete
    end

  end
end