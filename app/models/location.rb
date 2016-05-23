class Location < ActiveRecord::Base
  # Search
  include PgSearch
  pg_search_scope :search_by_name, :against => :name, :using => [:dmetaphone, :trigram]
	
  def self.search(term)
    where('LOWER(name) LIKE ?', "%#{term.downcase}%")
  end

  # Relationships
  has_many :events

  # Scopes
  scope :alphabetical, -> { order(:name) }

  # Validations
  validates_presence_of :name, :latitude, :longitude, :active
  validates_numericality_of :latitude, :longitude

  # Methods
end
