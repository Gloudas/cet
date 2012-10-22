
class User < ActiveRecord::Base

  belongs_to :profile

  has_many :projects

  def self.find_or_create_from_auth_hash(auth_hash)
    # just print out the auth_hash for now...
    print "\n\n\n\n\n\n\n\n\n\n\n\n\n"
    auth_hash.keys.each do |k|
      print "key:    " + k + "\n"
      print "value:    "
      print auth_hash[k]
      print "\n\n"
    end
    print "\n\n\n\n\n\n\n\n\n\n\n\n\n"

    # should create a new user or retreive the user if he already exists
    

  end

end
