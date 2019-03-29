# == Schema Information
#
# Table name: entries
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  url         :text
#  content     :text
#  description :text
#  image       :text
#  published   :datetime
#  guid        :string
#  feed_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  full_text   :text
#

class Entry < ApplicationRecord
  belongs_to :feed

  scope :since, -> (days) {
    where('DATE(published) >= ? AND DATE(published) < ?', Date.tomorrow - days, Date.tomorrow)
    .order(published: :desc)
  }

  after_save :load_full_content

  def self.create_from_feed(entry, feed)
    where(guid: entry.id).first_or_initialize do |e|
      puts "Creating #{entry.title} in #{feed}"
      e.feed = feed
      e.title = entry.title
      e.content = entry.content
      e.description = entry.summary
      e.url = entry.url
      e.image = entry.image
      e.published = entry.published
      e.save
    end
  end

  def to_s
    "#{title}"
  end

  protected

  def load_full_content
    sleep 30
    api = "https://boilerpipe-web.appspot.com/extract?url=#{url}&extractor=ArticleExtractor&output=text&extractImages=&token="
    data = HTTParty.get api
    text = data.to_s
    text = ActionController::Base.helpers.strip_tags text
    text = text.gsub('Envoyer par e-mail', '')
    update_column :full_text, text
  rescue
  end
end
