class Document < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :avatar, :description, :updater#, :uploader
  
  #validations
  #validates :field, :presence => true
  #validates :avatar, :attachment_presence => true
  
  #associations
  belongs_to :project
  belongs_to :updater, :class_name => "User", :foreign_key => "updater_id"
  #belongs_to :uploader, :class_name => "User", :foreign_key => "uploader_id"

  #paperclip
  has_attached_file :avatar
  
end
