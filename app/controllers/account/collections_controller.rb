class Account::CollectionsController < ApplicationController
  before_action :find_topic, :only => [:create, :destroy]
  before_action :find_user_collection, :only => [:destroy]
  def index
    @collections = current_user.collections
  end

  def create
    current_user.collections << @topic
  end

  def destroy
    @user_collection.destroy
  end


protected

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def find_user_collection
    @user_collection = current_user.user_collections.find_by(topic_id: @topic)
  end

end
