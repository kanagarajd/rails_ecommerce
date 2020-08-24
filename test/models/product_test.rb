require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
   end

   test "Price should not be negative" do
    product = Product.new(title: "Title", description: "description", image_url: "image_url")
    assert product.invalid?
    
    product.price = -1
    assert product.invalid?
    assert product.errors[:price].any?
    puts "=============="
    puts product.errors[:price]
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price] 

    product.price = 1
    assert product.valid?
  end

  test "product title should be unique" do
  	product = Product.new(title: "MyString", description: "desc", image_url: "url")
  	assert product.invalid?

  	assert product.errors[:title].any?
  	puts product.errors[:title]

  	assert_equal ["has already been taken"], product.errors[:title]
  end
end
