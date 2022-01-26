require_relative "../views/customer_view"
require_relative "../models/customer"

class CustomersController
    def initialize(repo)
        @repo = repo
        @view = CustomerView.new
    end

    def add
        name = @view.ask_user_customer
        address = @view.ask_user_address        
        new_customer = Customer.new(name: name, address: address)     
        @repo.add(new_customer)
    end

    def list
        @view.display(@repo.all)
    end
end