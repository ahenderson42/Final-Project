require "csv"

Product.delete_all
Category.delete_all
Company.delete_all
Order.delete_all
Shopper.delete_all
ProductOrder.delete_all
Province.delete_all

Province.create(name: "Alberta", code: "AB", taxes: 0.05)
Province.create(name: "British Columbia", code: "BC", taxes: 0.12)
Province.create(name: "Manitoba", code: "MB", taxes: 0.12)
Province.create(name: "New Brunswick", code: "NB", taxes: 0.15)
Province.create(name: "Newfoundland and Labrador", code: "NL", taxes: 0.15)
Province.create(name: "Northwest Territories", code: "NT", taxes: 0.05)
Province.create(name: "Nova Scotia", code: "NS", taxes: 0.15)
Province.create(name: "Nunavut", code: "NU", taxes: 0.05)
Province.create(name: "Ontario", code: "ON", taxes: 0.13)
Province.create(name: "Prince Edward Island", code: "PE", taxes: 0.15)
Province.create(name: "Quebec", code: "QC", taxes: 0.14975)
Province.create(name: "Saskatchewan", code: "SK", taxes: 0.11)
Province.create(name: "Yukon", code: "YT", taxes: 0.05)

# filename = Rails.root.join("db/Wearables-DFE-truncated-utf-8.csv")
# puts "Loading products from csv file #{filename}"

# csv_data = File.read(filename)
# products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# products.each do |p|
#   category = Category.find_or_create_by(name: p["Category"])
#   product = Product.find_or_create_by(name: p["Product.Name"])
# end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?