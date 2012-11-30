class Event < ActiveRecord::Base
  attr_accessible :description, :name, :location, :startTime, :endTime, :school_id

  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :startTime, :presence => true
  validates :endTime, :presence => true

  belongs_to :school
end
