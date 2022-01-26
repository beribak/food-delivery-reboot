class OrderRepository
    def initialize(csv_file, meal_repo, employee_repo, customer_repo)
        @meal_repository = meal_repo
        @employee_repository = employee_repo
        @customer_repository = customer_repo
        
        @orders = []
        @csv_file = csv_file
        @next_id = 1

        if File.exist?(@csv_file)
            load_csv
        end
    end


    def undelivered_orders
        array = @orders.select{|order| !order.delivered? }
    end

    def add(order)
        order.id = @next_id 
        @next_id += 1
        @orders << order   
        save_csv 
    end

    def all
        @orders
    end

    def find(id)
        @orders.each do |order|
            return order if order.id == id
        end
    end

    private

    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            #row = {meal_id: 1, customer_id: 2, meal:}
            row[:id] = row[:id].to_i
            row[:meal] = @meal_repository.find(row[:meal_id].to_i)
            row[:employee] = @employee_repository.find(row[:employee_id].to_i)
            row[:customer] = @customer_repository.find(row[:customer_id].to_i)
            row[:delivered] = row[:delivered] == "true" 
            @orders << Order.new(row) 
        end

        @next_id = @orders.last.id + 1 if @orders.count > 0            
    end

    def save_csv
        CSV.open(@csv_file, "wb") do |csv|
            csv << ["id", "delivered", "meal_id", "employee_id", "customer_id"]
            @orders.each do |order|
                csv << [order.id, order.delivered?, order.meal.id, order.employee.id, order.customer.id]
            end
        end
    end
end
