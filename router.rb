# TODO: implement the router of your app.
class Router
    def initialize(meals_controller, customers_controller)
      @meals_controller = meals_controller
      @customers_controller = customers_controller
    end

    def run
        condition = true

        while condition
            puts "==============="
            puts "=====MENU======"
            puts "==============="
           
            puts "What do you want to do"
            puts "1. Add meal"
            puts "2. List meals"
            puts "3. Add customer"
            puts "4. List customers"
            puts "5. Exit"
            user_choice = gets.chomp.to_i

            case user_choice
            when 1 
                @meals_controller.add
            when 2 
                @meals_controller.list
            when 3 
                @customers_controller.add
            when 4 
                @customers_controller.list
            when 5
                condition = false
            end
        end
    end
end