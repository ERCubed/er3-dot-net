class Page < ActiveRecord::Base

  def self.getCompanyTasks(id)
    @companytasks = Task.where("company_id = ?", id)
    return @companytasks
  end

end
