class TopicMailer < ActionMailer::Base
  default from: Setting.email_sender

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.topic_mailer.collection_create.subject
  #
  def topic_create(topic)
    @topic = topic
    @board = topic.board
    @user = topic.author
    @mail = @user.email
    @link = board_topic_url(@board, @topic)
    @greeting = "Hi"

    @subject = "您已成功在Board: #{@board.name}內新增了一篇Topic~"

    mail to: @mail, subject: @subject
  end
end
