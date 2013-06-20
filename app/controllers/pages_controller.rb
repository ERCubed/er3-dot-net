class PagesController < ApplicationController
  def index
    #@users = User.all
  end
  
  def resume
    @companies = Company.order("end_date DESC")
    @tasks = Task.all
  end
  
  
end
