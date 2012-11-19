class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :time

  validates :name, :presence => true, :uniqueness => true
  belongs_to :school
end
