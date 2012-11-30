class Project < ActiveRecord::Base

  # mass assignment
  attr_accessible :title, :description, :creator

  validates :title, :presence => true
  validates :description, :presence => true

  has_and_belongs_to_many :users, :uniq => true
  belongs_to :school
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :documents
  has_many :comments
  
  def add_collaborator(user)
    self.users << user
  end

  def add_collaborator_by_email(email)
    user = User.find_by_email(email)
    success = false
    begin
      self.users << user
      success = true
    rescue
    end if user
    return success
  end
end
