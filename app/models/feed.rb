# == Schema Information
#
# Table name: feeds
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  url         :text
#  last_import :datetime
#  image       :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Feed < ApplicationRecord
  after_save :sync

  def self.sync_all
    find_each do |feed|
      feed.sync
    end
  end

  protected

  def sync
    xml = HTTParty.get(url).body
    feed = Feedjira::Feed.parse(xml)
    self.update_columns title: feed.title,
                        image: feed.image.url,
                        description: feed.description
    feed.entries.each do |entry|
      Entry.create_from_feed entry, self
    end
  end
end
