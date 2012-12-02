  class User < ActiveRecord::Base

  attr_accessible :uid, :name, :email, :school, :major, :gradyear, :aboutme, :admin

  validates :email, :presence => true, :uniqueness => true, :email_format => {:message => "is not in a valid format!"}
  validates :school, :presence => true

  belongs_to :school
  has_and_belongs_to_many :projects, :uniq => true
  # should user deletion caused all created projects to be destroyed? hmm... right now yes
  has_many :created_projects, :class_name => 'Project', :foreign_key => "creator_id", :dependent => :destroy
  has_many :comments, :dependent => :destroy

  def self.find_or_create_from_auth_hash(auth_hash)
    # create a new user or retreive the user if he already exists
    @user = User.find_by_uid(auth_hash[:uid])
    if @user.nil?
      #TODO: school should be set differently
      @user = User.create!(:uid => auth_hash[:uid], :name => auth_hash[:info][:name], :email => auth_hash[:info][:email], :school => School.find_by_uri('berkeley'), :admin => false)
    end
    return @user
  end

  def self.search(search)
    if search != nil
      find(:all, :conditions => ['lower(email) WHERE ? OR 3 lower(name) LIKE ?', "%#{search}%.lowercase", "%#{search}%.lowercase"])
    end
  end

end
