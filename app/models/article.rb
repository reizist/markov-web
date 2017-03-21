# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  blog_id    :integer
#  text       :text(65535)
#  html       :text(65535)
#  markdown   :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#
# Indexes
#
#  index_articles_on_blog_id  (blog_id)
#  index_articles_on_url      (url) UNIQUE
#

class Article < ApplicationRecord
  belongs_to :blog
end
