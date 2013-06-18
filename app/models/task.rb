class Task < ActiveRecord::Base
  attr_accessible :company_id, :importance, :name, :tag_list
  acts_as_taggable
  
  belongs_to :company
end
