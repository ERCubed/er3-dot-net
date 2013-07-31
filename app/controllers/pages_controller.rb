class PagesController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def resume
    @companies = Company.order("end_date DESC")
    @tasks = Task.all
  end
  
  def languages
    
  end
  
  def othersites
    
  end

  def about
    @tweets = Twitter.user_timeline("ercubed")[0..4]
    @twuser = Twitter.user("ercubed")
    @pp_tweets = Twitter.user_timeline("PastorPrime")[0..4]
    @pp_twuser = Twitter.user("PastorPrime")
  end

  def contact
    @contact = ContactUs.new

  end
  
  def tumblr
    @tumblrClient = Page.newTumblrClient
  end
  
  def tumblr_upload
    @tumblrClient = Page.newTumblrClient
    site_name = @tumblrClient.info["user"]["name"]+".tumblr.com"
    
    if params["content_type"] == "image"
      ### Handle posting an image to Tumblr
      raw = params["file"].read
      id = @tumblrClient.photo(site_name, {:data_raw => [raw], :caption => params["article"]})
    elsif params["content_type"] == "video"
      ### Handle posting a video to Tumblr
      raw = params["file"].read
      id = @tumblrClient.video(site_name, {:data_raw => [raw], :caption => params["article"]})
    else
      ### Default to posting just text to Tumblr
      id = @tumblrClient.text(site_name, {:title => params["title"], :body => params["article"]})
    end
    if id
      if id["status"].to_s != "200"
        redirect_to tumblr_url, :notice => params["content_type"].humanize + " Posted Successfully" 
      else
        redirect_to tumblr_url, :notice => params["content_type"].humanize + " did not post to " + site_name + ". Received " + id["status"] + " status message."
      end
    else
      redirect_to tumblr_url, :notice => "Post failed to upload for some reason. No ID returned for status check. PLease try again."
    end
  end
  
end
