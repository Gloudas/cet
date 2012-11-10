class Project < ActiveRecord::Base

  validates :title, :presence => true
  validates :description, :presence => true

  has_and_belongs_to_many :users
  belongs_to :school
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  
  def add_collaborator(user)
    self.users << user
  end

  def add_collaborator_by_email(email)
    user = User.find_by_email(email)
    self.users << user if user
  end
end
