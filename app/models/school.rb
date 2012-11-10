class School < ActiveRecord::Base

  attr_accessible :name, :location

  validates :name, :presence => true, :uniqueness => true
  validates :location, :presence => true

  has_many :users
  has_many :projects

end
