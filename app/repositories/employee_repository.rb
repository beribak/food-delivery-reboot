class EmployeeRepository

    def initialize(csv_file)
        @employees = []
        @csv_file = csv_file
        @next_id = 1

        if File.exist?(@csv_file)
            load_csv
        end
    end

    def all
        @employees
    end
    def all_delivery_guys
        array = @employees.select{|employee| employee.role == "delivery_guy"}
        array
    end
    
    def find_by_username(username)
        @employees.find{|employee| employee.username == username}
    end

    def find(id)
        @employees.each do |employee|
            return employee if employee.id == id
        end
    end

    private

    def load_csv
        CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i
            @employees << Employee.new(row) 
        end

        @next_id = @employees.last.id + 1 if @employees.count > 0            
    end

    def save_csv
        CSV.open(@csv_file, "wb") do |csv|
            csv << ["id", "name", "password"]
            @employees.each do |employee|
                csv << [employee.id, employee.username, employee.password]
            end
        end
    end
end
