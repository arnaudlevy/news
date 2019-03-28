# == Schema Information
#
# Table name: entries
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  url        :text
#  content    :text
#  descrition :text
#  image      :text
#  published  :datetime
#  guid       :string
#  feed_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ApplicationRecord
  belongs_to :feed

  def self.create_from_feed(entry, feed)
    where(feed: feed, guid: entry.id).first_or_initialize do |e|
      e.title = entry.title
      e.content = entry.content
      e.description = entry.summary
      e.url = entry.url
      e.image = entry.image
      e.published = entry.published
      e.save
    end
  end
end
