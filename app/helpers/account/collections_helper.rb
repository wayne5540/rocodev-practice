module Account::CollectionsHelper
  def render_account_collection_link(user, topic)
    if !user
      return link_to("登入後即可收藏文章", "#", :class => "btn btn-success", :disabled => true)
    end

    if user.has_collection?(topic)
      link_to("取消收藏", account_collection_path(id: topic), :class => "btn btn-warning", method: :delete, remote: true)
    else
      link_to("收藏", account_collections_path(id: topic), :class => "btn btn-success", method: :post, remote: true)
    end
  end
end
