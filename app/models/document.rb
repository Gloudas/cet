class Document < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :avatar, :uploader, :description, :updater
  
  #validations
  #validates :field, :presence => true
  #validates :avatar, :attachment_presence => true
  
  #associations
  belongs_to :project
  belongs_to :uploader, :class_name => "User", :foreign_key => "uploader_id"
  belongs_to :updater, :class_name => "User", :foreign_key => "updater_id"

  #paperclip
  has_attached_file :avatar
  
end
