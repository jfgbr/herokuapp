module ServicesHelper
  include ApplicationHelper
  def services_by_category(employee_id,category_id)
    if employee_id != "0" and category_id != "0"
      service = User.find(employee_id).services.where(category_id: category_id)
      respond_to do |format|
        format.json { render :json => service }
      end
    else
      respond_empty
    end
  end
end