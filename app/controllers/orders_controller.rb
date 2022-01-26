require_relative "../views/order_view"
require_relative "../views/view"
require_relative "../views/customer_view"
require_relative "../models/order"
require_relative "../views/employee_view"

class OrdersController
    def initialize(meal_repo, employee_repo, customer_repo, order_repo)
        @order_repository = order_repo
        @meal_repository = meal_repo
        @employee_repository = employee_repo
        @customer_repository = customer_repo
 
        @employee_view = EmployeeView.new
        @meals_view = View.new
        @order_view = OrderView.new
        @customer_view = CustomerView.new
    end

    def add
        meal = meal_get  
        customer = customer_get
        employee = employee_get
        @order_repository.add(Order.new(meal: meal, customer: customer, employee: employee))
    end

    def list_my_orders(employee)
        orders = @order_repository.all.select {|order| order.employee == employee && !(order.delivered?)}
        @order_view.display(orders)
    end

    def list_undelivered_orders
        list_orders = @order_repository.undelivered_orders 
        @order_view.display(list_orders)
    end

    private

    def meal_get
        meals = @meal_repository.all
        @meals_view.display(meals)
        choice = @meals_view.ask_user_for_meal
        meals[choice] 
    end

    def customer_get
        customers = @customer_repository.all
        @customer_view.display(customers)
        choice = @customer_view.ask_for_customer
        customers[choice] 
    end

    def employee_get
        employees = @employee_repository.all
        @employee_view.display(employees)
        choice = @employee_view.ask_user_for_employee
        employees[choice] 
    end
end