class PagesController < ApplicationController
  def index
    #@users = User.all
  end
  
  def resume
    @companies = Company.all
    @tasks = Task.all
  end
  
  
end
