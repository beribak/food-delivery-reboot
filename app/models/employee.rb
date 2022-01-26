
class Employee
    attr_reader :username, :password, :role
    attr_accessor :id

    def initialize(attr = {})
        @id = attr[:id]
        @role = attr[:role]
        @username = attr[:username]
        @password = attr[:password]
    end

    def manager?
        @role == "manager"
    end

    def delivery_guy? # rider
        @role == "delivery_guy" # "rider"
    end

end