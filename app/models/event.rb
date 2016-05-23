class Event < ActiveRecord::Base
  # Relationships
  belongs_to :location
  has_many :user_events
  has_many :event_organizations
  has_many :event_tags
  has_many :tags, through: :event_tags
  has_many :users, through: :user_events
  has_many :organizations, through: :event_organizations

  # Validations
  validates_presence_of :name, on: :create
  validates_presence_of :location, on: :create
  validates_presence_of :start_time, on: :create
  validates_presence_of :end_time, on: :create

  # Scopes
  scope :chronological, -> { order(start_datetime: :desc) }
  scope :by_location,  -> { order(:location) }
  scope :for_location,  -> (location_id) { where(location_id: location_id) }
  scope :upcoming, -> { where("end_time >= ? ", DateTime.now) }
  scope :current, -> { where(" ? BETWEEN start_time AND end_time", DateTime.now) }

end
