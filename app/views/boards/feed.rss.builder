xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Rocodev-Practice"
    xml.description "Rocodev RD trainnig"
    xml.link board_url(@board)

    for topic in @topics
      xml.item do
        xml.title topic.title
        xml.description topic.content
        xml.pubDate topic.created_at.to_s(:rfc822)
        xml.link board_topic_url(topic.board_id, topic)
        xml.guid board_topic_url(topic.board_id, topic)
      end
    end
  end
end