class Event < ActiveRecord::Base
  attr_accessible :description, :name, :location, :startTime, :endTime, :school_id

  validates_presence_of :name
  belongs_to :school
end
