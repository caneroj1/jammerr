module UsersHelper
  def matches_action?(action)
    params[:action].eql?(action) ? "active" : "inactive"
  end
end
