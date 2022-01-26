require "csv"
require_relative "../models/meal"

class MealRepository
    def initialize(csv_file)
        @meals = []
        @csv_file = csv_file
        @next_id = 1

        if File.exist?(@csv_file)
            load_csv
        end
    end

    def add(meal)
        meal.id = @next_id 
        @next_id += 1
        @meals << meal   
        save_csv 
    end

    def all
        @meals
    end

    def find(id)
        @meals.each do |meal|
            return meal if meal.id == id
        end
    end

    private

    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i
            row[:price] = row[:price].to_i
            @meals << Meal.new(row) 
        end

        @next_id = @meals.last.id + 1 if @meals.count > 0            
    end

    def save_csv
        CSV.open(@csv_file, "wb") do |csv|
            csv << ["id", "name", "price"]
            @meals.each do |meal|
                csv << [meal.id, meal.name, meal.price]
            end
        end
    end
end

# repo = MealRepository.new("data/meals.csv")
# repo.create(Meal.new(name: "Pizza", price: "5"))
# puts repo.meals