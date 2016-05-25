namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'

    # Step 1: clear any old data in the db
    [Event, Location].each(&:delete_all)


    # Step 2: add some locations to work with (small set for now...)
    Location.populate(3) do |location|
      location.name = %w[CUC Rangos Cut Fence Mall DH PH]
      location.latitude = [40.443565, 40.443271, 40.443097, 40.442079, 40.442471, 40.441733]
      location.longitude = [-79.942111, -79.942894, -79.943119, -79.945459, -79.944594, -79.946272]
      location.active = true
      Event.populate(4) do |event|
        event.name = ["Almost Midnight Breakfast", "Dougnut Dash", "Pre-College Fireworks", "Cohen Center Expansion Grand Opening"]
        event.location_id = location.id
        event.description = "NO"
        event.start_time = 1.day.from_now.to_datetime
        event.end_time = 2.days.from_now.to_datetime
      end
    end

    # # Step 3: add some events that PATS will offer
    # Event.populate(4) do |event|
    #   event.name = %w["Almost Midnight Breakfast" "Dougnut Dash" "Pre-College Fireworks" "Cohen Center Expansion Grand Opening"]
    #   event.location = Location.all.to_a
    #   event.description = "NO"
    #   event.start_time = 1.day.from_now.to_datetime
    #   event.end_time = 2.days.from_now.to_datetime
    # end

    # # Step 4: add 20 owners to the system and associated pets
    # Owner.populate 20 do |owner|
    #   # get some fake data using the Faker gem
    #   owner.first_name = Faker::Name.first_name
    #   owner.last_name = Faker::Name.last_name
    #   owner.street = Faker::Address.street_address
    #   owner.city = Faker::Address.city
    #   # assume PA since this is a Pittsburgh vet office
    #   owner.state = "PA"
    #   # randomly assign one of four area zip codes
    #   owner.zip = ["15213", "15212", "15090", "15237"]
    #   # want to store phone as 10 digits in db and use rails helper
    #   # number_to_phone to format it properly in views
    #   owner.phone = rand(10 ** 10).to_s.rjust(10,'0')
    #   owner.email = "#{owner.first_name.downcase}.#{owner.last_name.downcase}@example.com"
    #   # assume all the owners still have living pets
    #   owner.active = true
    #   # set the timestamps
    #   owner.created_at = Time.now
    #   owner.updated_at = Time.now
    #
    #   # Step 4A: add 1 to 3 pets for each owner
    #   Pet.populate 1..3 do |pet|
    #     pet.owner_id = owner.id
    #     # assign an animal id from ones created in Step 2
    #     pet.animal_id = Animal.all.to_a.map{|a| a.id}
    #     # randomly assign a pet name from list of typical pet names
    #     pet.name = %w[Sparky Dusty Caspian Lucky Fluffy Snuggles Snuffles Dakota Montana Cali Polo Buddy Mambo Pickles Pork\ Chop Fang Zaphod Yeller Groucho Meatball BJ CJ TJ Buttercup Bull Bojangles Copper Fozzie Nipper Mai\ Tai Bongo Bama Spot Tango Tongo Weeble]
    #     # randomly assign female status
    #     pet.female = [true, false]
    #     # pick a DOB at random ranging for 12 yrs ago to 1 year ago
    #     pet.date_of_birth = 12.years.ago..1.year.ago
    #     # assume all the pets are alive and active
    #     pet.active = true
    #     # set the timestamps
    #     pet.created_at = Time.now
    #     pet.updated_at = Time.now
    #
    #     # Step 4B: add between 1 to 15 visits for each pet
    #     Visit.populate 1..15 do |visit|
    #       visit.pet_id = pet.id
    #       # set the visit to sometime between DOB and the present
    #       visit.date = pet.date_of_birth..Time.now
    #       # different animals fall in different weight ranges so we need
    #       # to find the right range of weights for the visiting pet
    #       case pet.animal_id
    #       when 1  # birds tend to be between 1 & 2 pounds
    #         weight_range = (1..2)
    #       when 2  # cats
    #         weight_range = (5..15)
    #       when 3  # dogs
    #         weight_range = (10..60)
    #       when 4  # ferrets
    #         weight_range = (1..6)
    #       when 5  # rabbits
    #         weight_range = (2..7)
    #       end
    #       # now assign the pet a weight within the range
    #       visit.weight = weight_range
    #       # a couple of blurbing sentences for treatment notes
    #       visit.notes = Populator.sentences(2..10)
    #       # set the timestamps
    #       visit.created_at = Time.now
    #       visit.updated_at = Time.now
    #
    #       # Step 4C: add some vaccinations to _some_ of the visits
    #       # Assume that approximately 1 in 3 visits includes a vaccine
    #       get_vaccine = rand(3)  # will generate numbers 0,1,2 at random
    #       if get_vaccine.zero?   # pet's number came up... time for injection
    #         # first, figure out what vaccines this animal can get
    #         # we are using the for_animal named scope written earlier
    #         possible_vaccines = Vaccine.for_animal(pet.animal_id).map{|v| v.id}
    #         # assume that get either 1 or 2 vaccines per visit
    #         Vaccination.populate 1..2 do |vaccination|
    #           vaccination.visit_id = visit.id
    #           vaccination.vaccine_id = possible_vaccines
    #         end
    #       end
    #     end
    #   end
    # end
  end
end
