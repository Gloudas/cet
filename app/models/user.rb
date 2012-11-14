class User < ActiveRecord::Base

  attr_accessible :uid, :name, :email, :school, :major, :gradyear, :aboutme, :admin

  validates :email, :presence => true, :uniqueness => true
  validates :school, :presence => true

  belongs_to :school
  has_and_belongs_to_many :projects
  has_many :created_projects, :class_name => 'Project', :foreign_key => "creator_id"

  def self.find_or_create_from_auth_hash(auth_hash)
    #print out the auth_hash
#auth_hash.keys.each do |k|
#     print "key:    " + k + "\n"
#     print "value:    "
#     print auth_hash[k]
#     print "\n\n"
#   end

    # create a new user or retreive the user if he already exists
    @user = User.find_by_uid(auth_hash[:uid])
    if @user.nil?
      #TODO: admin status will be determined differently
      if auth_hash[:info][:name].eql? 'admin'
        @user = User.create(:uid => auth_hash[:uid], :name => auth_hash[:info][:name], :email => auth_hash[:info][:email], :school => School.find_by_uri('berkeley'), :admin => true)
      else
      #TODO: school should be set differently
        @user = User.create(:uid => auth_hash[:uid], :name => auth_hash[:info][:name], :email => auth_hash[:info][:email], :school => School.find_by_uri('berkeley'), :admin => false)
      end
    end
    return @user
  end

end
