class CustomerView
    def display(array)
        array.each do |customer|
            puts "#{customer.name}"
        end
    end

    def ask_user_customer
        p "What customer do you want to add?"
        gets.chomp
    end

    def ask_user_address
        p "What isyour address?"
        gets.chomp
    end
end