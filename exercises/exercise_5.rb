require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...

total_stores = Store.all
# Output the total revenue for the entire company (all stores), using Active Record's .sum calculation method.
puts "Gross company revenue: $#{Store.sum(:annual_revenue)}"

# On the next line, also output the average annual revenue for all stores.
puts "Average annual revenue per store: $#{Store.sum(:annual_revenue) / total_stores.length}"

# Output the number of stores that are generating $1M or more in annual sales. Hint: Chain together where and size (or count) Active Record methods.
puts "Stores over 1M revenue: #{Store.where('annual_revenue > ?', 1000000).count()}" 
