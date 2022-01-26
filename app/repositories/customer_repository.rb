require "csv"
require_relative "../models/customer"

class CustomerRepository
    def initialize(csv_file)
        @customers = []
        @csv_file = csv_file
        @next_id = 1

        if File.exist?(@csv_file)
            load_csv
        end
    end

    def add(customer)
        customer.id = @next_id 
        @next_id += 1
        @customers << customer   
        save_csv 
    end

    def all
        @customers
    end

    def find(id)
        @customers.each do |customer|
            return customer if customer.id == id
        end
    end

    private

    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i
            @customers << Customer.new(row) 
        end

        @next_id = @customers.last.id + 1 if @customers.count > 0            
    end

    def save_csv
        CSV.open(@csv_file, "wb") do |csv|
            csv << ["id", "name", "address"]
            @customers.each do |customer|
                csv << [customer.id, customer.name, customer.address]
            end
        end
    end
end
