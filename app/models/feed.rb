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
  has_many :entries, dependent: :destroy

  after_save :sync_feed

  def self.sync_all
    puts "Synchronizing feeds"
    find_each { |feed| feed.sync }
  end

  def sync
    puts "Feed #{to_s}"
    sync_feed
    sync_entries
  end

  def to_s
    "#{title}"
  end

  protected

  def feed
    unless @feed
      xml = HTTParty.get(url).body
      @feed = Feedjira.parse(xml)
    end
    @feed
  end

  def sync_feed
    self.update_columns title: feed.title,
                        description: feed.description
    self.update_column :image, feed.image.url unless feed.image.nil?

  end

  def sync_entries
    feed.entries.each do |entry|
      Entry.create_from_feed entry, self
    end
  end
end
