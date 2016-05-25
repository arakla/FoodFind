module Contexts
  module Events
    # Context for events (assumes location context)
    def create_events
      @ASABBQ = FactoryGirl.create(:event, location: @donnerDitch, name: "ASA Barbeque", image_path: "/images/example.jpg", description: "ASA Barbeque at Donner Ditch. Come play volleyball and enjoy some burgers.", age_restriction: 0, start_datetime: DateTime.now, end_datetime: 3.hours.from_now.to_datetime)
      @MusicPicnic = FactoryGirl.create(:event, location: @CFALawn, name: "School of Music Picnic", image_path: "/images/quarternote.jpg", description: "Music Picnic", age_restriction: 0, start_datetime: DateTime.2.hours.from_now.to_datetime, end_datetime: 4.hours.from_now.to_datetime)
      @WineTasting = FactoryGirl.create(:event, location: @rangos, name: "Wine Tasting Stuco", image_path: "/images/wine_bottle.jpg", description: "Wine tasting Stuco class", age_restriction: 21, start_datetime: 4.hours.from_now.to_datetime, end_datetime: 6.hours.from_now.to_datetime)
    end
    
    def destroy_events
      @ASABBQ.delete
      @MusicPicnic.delete
      @WineTasting.delete
    end

  end
end