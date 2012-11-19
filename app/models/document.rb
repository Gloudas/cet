class Document < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :avatar, :uploader#, :description
  
  #validations
  #validates :field, :presence => true
  validates :avatar, :attachment_presence => true
  
  #associations
  belongs_to :school
  belongs_to :uploader, :class_name => "User", :foreign_key => "uploader_id"
  
  #paperclip
  has_attached_file :avatar
  
end
