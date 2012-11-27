class Event < ActiveRecord::Base
  attr_accessible :description, :name, :time

  validates :name, :presence => true, :uniqueness => true
  belongs_to :school
end
