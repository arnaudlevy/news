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

require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
