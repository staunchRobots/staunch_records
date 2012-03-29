require 'spec_helper'

describe Product do
  
  before { @product = Product.new(album: "Hey Jude", artist: "The Beatles", description: "Original U.K. 1968 promotional LP", qty: 1, price: 1000.00, on_sale: true, sale_price: 900.99) }

  subject { @product }

  it { should respond_to(:album) }
  it { should respond_to(:artist) }
  it { should respond_to(:description) }
  it { should respond_to(:qty) }
  it { should respond_to(:price) }
  it { should respond_to(:on_sale) }
  it { should respond_to(:sale_price) }

  it { should be_valid }

  describe "with blank album" do
    before { @product.album = " " }
    it { should_not be_valid }
  end

  describe "with blank artist" do
    before { @product.artist = " " }
    it { should_not be_valid }
  end

  describe "with blank qty" do
    before { @product.qty = " " }
    it { should_not be_valid }
  end

  describe "with blank price" do
    before { @product.price = " " }
    it { should_not be_valid }
  end

  describe "with blank on_sale" do
    before { @product.on_sale = " " }
    it { should_not be_valid }
  end

  describe "with invalid qty" do
    before { @product.on_sale = -1 }
    it { should_not be_valid }
  end

  describe "with invalid price" do
    before { @product.price = -1 }
    it { should_not be_valid }
  end

  describe "with invalid on_sale" do
    before { @product.price = "true" }
    it { should_not be_valid }
  end

  describe "with invalid sale_price" do
    before { @product.sale_price = @product.price + 1 }
    it { should_not be_valid }
  end
end
