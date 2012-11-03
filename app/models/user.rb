class User < ActiveRecord::Base

  has_and_belongs_to_many :projects
  belongs_to :school

  attr_accessible :uid, :name, :email, :school, :projects

  def self.find_or_create_from_auth_hash(auth_hash)
    #print out the auth_hash
    auth_hash.keys.each do |k|
      print "key:    " + k + "\n"
      print "value:    "
      print auth_hash[k]
      print "\n\n"
    end
    # create a new user or retreive the user if he already exists
    @user = User.find_by_uid(auth_hash[:uid])
    if @user.nil?
      @user = User.create(:uid => auth_hash[:uid])
    end
    return @user
  end

end
