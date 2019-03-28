class Feed < ApplicationRecord
  def self.update_all
    find_each do |feed|
          eed.update
    end
  end

  def update
    xml = HTTParty.get(url).body
    feed = Feedjira.parse(xml)
    feed.entries.each do |entry|
      Entry.create_from_feed entry, self
    end
  end
end
