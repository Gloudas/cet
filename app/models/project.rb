class Project < ActiveRecord::Base

  attr_accessible :title, :description, :creator, :users

  #has_and_belongs_to_many :collaborators, :class_name =>"User", :foreign_key => "id"
  has_and_belongs_to_many :users
  belongs_to :school
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  
  validates_presence_of :title
  validates_presence_of :description

  def add_collaborator(user)
    self.users << user
  end

  def add_collaborator_by_email(email)
    user = User.find_by_email(email)
    self.users << user if user
  end
end
