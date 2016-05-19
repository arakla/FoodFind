class EventOrganization < ActiveRecord::Base
  belongs_to :event
  belongs_to :organization
end
