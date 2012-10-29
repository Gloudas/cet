class School < ActiveRecord::Base
  attr_accessible :name, :location, :users, :projects

  has_many :users
  has_many :projects

end
