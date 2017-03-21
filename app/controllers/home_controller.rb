class HomeController < ApplicationController
  def index
  end
  
  def post
    @url = params[:url]
    blog = Blog.find_or_create_by(url: @url)
    service = HatenaService.new(url: blog.url)
    
    service.articles(count: 3)
    @sentences = 3.times.map do |i|
      MarkovService.new(text: blog.digest).result
    end
    
    render :index
  end
end
