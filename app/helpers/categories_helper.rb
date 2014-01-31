module CategoriesHelper
  def category_for_select_by_employee(employee_id)
    #if employee_id.nil?
   #   @categories = Category.all.order("text ASC").collect { |m| [m.text, m.id] }
   # else
      #employee_services = EmployeeService.where(:employee_id => employee_id).service.category#.map { |m| [:id => m.service.category.id, :text => m.service.category.text] }
      #employee_services.collect { |m| [m.service.category.text, m.service.category.id] }
      #category = employee_services.collect { |m| [Category.new(:id => employee_services[1], :text => employee_services[0])] }
      #@cy = employee_services[1]
      categories = User.find(employee_id).categories
      respond_to do |format|
        format.json { render :json => categories}#{text: employee_services[0], id: employee_services[1] } }
      end
    #end
  end
  def services_by_category(category_id)
    category = Category.find(category_id)
    respond_to do |format|
      format.json { render :json => category.services }
    end
  end
end
