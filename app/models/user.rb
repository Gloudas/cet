class User < ActiveRecord::Base

  attr_accessible :uid, :name, :email, :school, :major, :gradyear, :aboutme, :admin

  validates :email, :presence => true, :uniqueness => true, :email_format => {:message => "is not in a valid format!"}
  validates :school, :presence => true

  belongs_to :school
  has_and_belongs_to_many :projects, :uniq => true
  has_many :created_projects, :class_name => 'Project', :foreign_key => "creator_id"

  def self.find_or_create_from_auth_hash(auth_hash)
    # create a new user or retreive the user if he already exists
    @user = User.find_by_uid(auth_hash[:uid])
    if @user.nil?
      #TODO: school should be set differently
      @user = User.create!(:uid => auth_hash[:uid], :name => auth_hash[:info][:name], :email => auth_hash[:info][:email], :school => School.find_by_uri('berkeley'), :admin => false)
    end
    return @user
  end

end
