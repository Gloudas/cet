  class User < ActiveRecord::Base

  attr_accessible :uid, :name, :email, :school, :major, :gradyear, :aboutme, :admin, :avatar

  validates :email, :presence => true, :uniqueness => true, :email_format => {:message => "is not in a valid format!"}
  validates :school, :presence => true

  belongs_to :school
  has_and_belongs_to_many :projects, :uniq => true
  # should user deletion caused all created projects to be destroyed? hmm... right now yes
  has_many :created_projects, :class_name => 'Project', :foreign_key => "creator_id", :dependent => :destroy
  has_many :comments, :dependent => :destroy

  #paperclip
  has_attached_file :avatar,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => "cet-aii"

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth[:uid]
      user.email = auth[:info][:email]
      user.school = School.find_by_uri('berkeley')
      user.admin = false
    end
  end

  def self.search(search)
    if search != nil
      find(:all, :conditions => ['lower(email) LIKE ? OR lower(name) LIKE ?', "%#{search}%".downcase, "%#{search}%".downcase])
    end
  end

end
