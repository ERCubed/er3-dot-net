class Page < ActiveRecord::Base
  
  def self.getCompanyTasks(id)
    @companytasks = Task.where("company_id = ?", id)
    return @companytasks
  end
  
  def self.isCurrent(date)
    if date > DateTime.now
      c = "Current"
    else 
      c = date.strftime("%B %Y")
    end 
    return c
  end
  
  def self.newTumblrClient
    Tumblr::Client.new
  end
  
  def self.photoInfo(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.binary_data = input_data.read
  end
  

end
