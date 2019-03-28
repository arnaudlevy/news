class Entry < ApplicationRecord
  belongs_to :feed

  def self.create_from_feed(entry, feed)
    where(feed: feed, guid: entry.guid).first_or_initialize do |e|
      e.title = entry.title
      e.content = entry.content
      e.url = entry.url
      e.image = entry.image
      e.published = entry.published
      e.save
    end
  end
end
