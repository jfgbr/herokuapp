class CategoriesController < ApplicationController
  include CategoriesHelper
  def employee
    category_for_select_by_employee(params[:employee_id])
  end
  def services
    services_by_category(params[:category_id])
  end
end
