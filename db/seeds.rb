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

filename = Rails.root.join("db/Wearables-DFE-truncated-utf-8.csv")
puts "Loading products from csv file #{filename}"

csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |product|
  category = Category.find_or_create_by(name: product["Category"])
  company = Company.find_or_create_by(name: product["Company.Name"])
  if category && category.valid?

    pr = category.products.create(
      name:     product["Name"],
      price:    product["Price"]
    )
    puts "Invalid Product" unless pr&.valid?
  else
    puts "Invalid category"
  end
end

# products_data = []
# CSV.foreach('db/Wearables-DFE-truncated-utf-8.csv', headers: true, encoding: "utf-8") do |row|
#   products_data << row.to_h
# end

# products_data.each do |data|
#   product = Product.create(name: data['Name'], price: data['Price'], location: data['Body.Location'])

#   puts "Invalid product" unless product&.valid?

#   company = Company.find_or_create_by(name: data['Company.Name'])
#   category = Category.find_or_create_by(name: data['Category'])
#   product.company = company
#   product.category = category
# end