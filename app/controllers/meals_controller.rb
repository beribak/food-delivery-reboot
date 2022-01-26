require_relative "../views/view"
require_relative "../models/meal"

class MealsController
    def initialize(repo)
        @repo = repo
        @view = View.new
    end

    def add
        name = @view.ask_user_name
        price = @view.ask_user_price.to_i        
        new_meal = Meal.new(name: name, price: price)     
        @repo.add(new_meal)
    end

    def list
        @view.display(@repo.all)
    end
end