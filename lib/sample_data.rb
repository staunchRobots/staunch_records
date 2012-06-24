class SampleData
  def create_users
    User.delete_all
    puts "Creating users"
    # Creates a user
    User.create!(email: "user@example.com", password: "user12345", password_confirmation: "user12345", admin: false)

    # Creates an admin
    User.create!(email: "admin@example.com", password: "admin12345", password_confirmation: "admin12345", admin: true)
  end

  def create_categories
    Category.delete_all
    puts "Creating categories"
    # Creates 5 categories
    { rock: "#FFFFFF", blues: "#0000FF", jazz: "#FF0000", classical: "#111111", folk: "#00FF00" }. each do |name, color|
      Category.create!(name: name.capitalize, color: color)
    end
  end

  def create_products
    Product.delete_all
    puts "Creating products"
    category_ids = Category.all.map(&:id)
    30.times do |i|
      Product.create!(album: "Whatever#{i}",
        artist: "Bob Marley #{31-i}",
        category_id: category_ids.sample,
        sale_price: 5,
        on_sale: false,
        qty: 10,
        price: 10+i*2,
      )
    end
  end

  def run
    if Rails.env.production?
      puts "Cannot run sample data script on production"
      return
    end
    create_users
    create_categories
    create_products
  end

end
