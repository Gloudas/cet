class Project < ActiveRecord::Base

  attr_accessible :title, :description

  has_and_belongs_to_many :users
  has_one :creator, :class_name => "User", :foreign_key => "id"
  belongs_to :school
  
  validates_presence_of :title
  validates_presence_of :description


end
