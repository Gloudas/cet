class Project < ActiveRecord::Base

  attr_accessible :title

  has_and_belongs_to_many :users
  has_one :creator_id, :class_name => "User", :foreign_key => "user_id"
  belongs_to :school
  
  validates_presence_of :creator_id


end
