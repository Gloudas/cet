
class School < ActiveRecord::Base

  has_many :users
  #as_many :projects THROUGH USERS

end
