# require needed files
require './test/sets/locations'
require './test/sets/events'
require './test/sets/organizations'
require './test/sets/tags'
require './test/sets/users'
require './test/sets/event_organizations'
require './test/sets/user_organizations'
require './test/sets/event_tags'
require '/test/sets/user_tags'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Locations
  include Contexts::Events
  include Contexts::Organizations
  include Contexts::Tags
  include Contexts::Users
  include Contexts::UserOrganizations
  include Contexts::EventTags
  include Contexts::UserTags
end