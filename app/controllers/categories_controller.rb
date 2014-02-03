class CategoriesController < ApplicationController
  include CategoriesHelper
  def employee
    @employee = params[:employee_id]
    category_for_select_by_employee(@employee)
  end
  def services
    services_by_category(@employee,params[:category_id])
  end
end
