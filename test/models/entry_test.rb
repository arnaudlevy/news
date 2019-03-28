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

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
