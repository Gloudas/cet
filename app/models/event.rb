class Event < ActiveRecord::Base
  attr_accessible :description, :name, :time, :school_id

  validates :name, :presence => {:message => "Event must have a name"}, :uniqueness => true
  belongs_to :school
end
