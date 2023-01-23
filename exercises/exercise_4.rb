require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...


# Borrowing and modifying the code from Exercise one, create 3 more stores:
# Surrey (annual_revenue of 224000, carries women's apparel only)
store4 = Store.create(name: "Surrey", annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
store4.save
# Whistler (annual_revenue of 1900000 carries men's apparel only)
store5 = Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
store5.save
# Yaletown (annual_revenue of 430000 carries men's and women's apparel)
store6 = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)
store6.save

# Using the where class method from Active Record, fetch (a collection of) only those stores that carry men's apparel. Assign the results to a variable @mens_stores.
@mens_stores = Store.where(mens_apparel: true, womens_apparel: false)

# Loop through each of these stores and output their name and annual revenue on each line.
x = 0
while x < @mens_stores.length
  puts "#{@mens_stores[x].name} revenue: $#{@mens_stores[x].annual_revenue}"
  x += 1
end


# Do another fetch but this time load stores that carry women's apparel and are generating less than $1M in annual revenue.
@womens_stores = Store.where('annual_revenue < ? AND mens_apparel = ? AND womens_apparel = ?', 1000000, false, true)

y = 0
while y < @womens_stores.length
  puts "#{@womens_stores[y].name} revenue: $#{@womens_stores[y].annual_revenue}"
  y += 1
end