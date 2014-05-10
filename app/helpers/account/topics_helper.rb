module Account::TopicsHelper

  def render_topic_content(topic)
    topic.content    
  end

  def render_topic_id(topic)
    topic.id
  end

  def render_topic_title(topic)
    topic.title
  end

  def avatar_exists?(topic)
    topic.avatar.exists?
  end

  def render_board_topic_path(topic)
    board_topic_path(topic.board_id, topic)
  end


end
