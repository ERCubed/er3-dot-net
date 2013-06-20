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

end
