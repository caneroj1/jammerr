module UsersHelper
  def can_edit_profile?
    if @user.id.eql?(current_user.id)
      content_tag(:span, "", class: "glyphicon glyphicon-pencil", id: "edit-pencil", data: { toggle: "tooltip", placement: "top", title: "Edit Profile"} )
    end
  end
  
  def matches_action?(action)
    params[:action].eql?(action) ? "active" : "inactive"
  end
end
