module CategoriesHelper
  include ApplicationHelper
  def category_for_select_by_employee(employee_id)
    if employee_id != "0"
      categories = User.find(employee_id).categories
      respond_to do |format|
        format.json { render :json => categories}
      end
    else
      respond_empty
    end
  end

end
