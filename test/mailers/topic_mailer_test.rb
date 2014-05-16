require 'test_helper'

class TopicMailerTest < ActionMailer::TestCase
  test "collection_create" do
    mail = TopicMailer.collection_create
    assert_equal "Collection create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
