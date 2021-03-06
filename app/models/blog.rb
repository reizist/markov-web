# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_blogs_on_url  (url) UNIQUE
#

class Blog < ApplicationRecord
  has_many :articles, inverse_of: :blog
  
  def digest(count: 3)
    articles.sample(count).pluck(:text).join
  end
end
