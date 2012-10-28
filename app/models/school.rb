class School < ActiveRecord::Base
  attr_accessible :name, :location

  has_many :users
  has_many :projects

end
