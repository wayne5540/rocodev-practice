module TopicsHelper
  def render_topic_content(topic)
    topic.content    
  end

  def render_topic_id(topic)
    topic.id
  end

  def render_topic_title(topic)
    topic.title
  end

  def render_topic_avatar(topic)
    topic.avatar.url
  end

  def render_topic_board(topic)
    topic.board.name
  end

  def render_topic_author(topic)
    topic.author.name
  end

  def avatar_exists?(topic)
    topic.avatar.exists?
  end

  def render_new_topic_path(board, topic)
    link_to("+New Topic", new_board_topic_path(board, topic), :class => "btn btn-mini btn-success" )
  end

  def render_topic_title_path(topic)
    link_to(topic.title, board_topic_path(topic.board_id, topic))
  end

  def render_edit_account_topic_path(topic)
    link_to("edit", edit_account_topic_path(topic), :class => "btn btn-default")
  end

  def render_destroy_account_topic_path(topic)
    link_to("delete", account_topic_path(topic), :class => "btn btn-default", :method => :delete, :confirm => "Are you sure?")
  end
  
end
