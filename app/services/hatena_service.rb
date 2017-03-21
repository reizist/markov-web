class HatenaService
  def initialize(url: nil)
    @url = url
  end
  
  def client
    @client = HBS::Client.new(url: @url)
  end
  
  def articles(count: 1)
    articles = client.list_articles(count: count)
    ActiveRecord::Base.transaction do
      blog = Blog.find_by(url: @url)
      articles.each do |article|
        _article = blog.articles.find_or_initialize_by(url: article.url)
        if _article.new_record?
          _article.update(text: article.text, markdown: article.markdown, html: article.html)
        end
      end
    end
    articles
  end
end