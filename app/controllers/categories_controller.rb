class CategoriesController < ApplicationController
  include CategoriesHelper
  def employee
    #@employee = params[:employee_id]
    category_for_select_by_employee(params[:employee_id])
  end
  def services
    services_by_category(params[:employee_id],params[:category_id])
  end
end
