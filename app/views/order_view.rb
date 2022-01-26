class OrderView
    def display(array)
        array.each do |order|
            puts "#{order.meal.name} #{order.customer.name} #{order.employee.username}"
        end
    end

    # def ask_user_customer
    #     p "What customer do you want to add?"
    #     gets.chomp
    # end

    # def ask_user_address
    #     p "What isyour address?"
    #     gets.chomp
    # end
end