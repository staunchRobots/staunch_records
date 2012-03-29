require 'spec_helper'

describe Product do
  
  let(:category) { @category = Category.new(name: "Rock", color: "grey") }
  before { @product = category.products.build(album: "Hey Jude", artist: "The Beatles", qty: 1, price: 1000.00, on_sale: :true, sale_price: 900.99) }

  subject { @product }

  it { should respond_to(:album) }
  it { should respond_to(:artist) }
  it { should respond_to(:qty) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:on_sale) }
  it { should respond_to(:sale_price) }
  it { should respond_to(:category_id) }
  it { should respond_to(:category) }
  its(:category) { should == category }

  it { should be_valid }

  describe "with blank album" do
    before { @product.album = " " }
    it { should_not be_valid }
  end

  describe "with blank artist" do
    before { @product.artist = " " }
    it { should_not be_valid }
  end

  describe "with blank on_sale" do
    before { @product.on_sale = " " }
    it { should_not be_valid }
  end

  describe "with blank category_id" do
    before { @product.category_id = " " }
    it { should_not be_valid }
  end

  describe "with a non-numeric qty" do
    before { @product.qty = "string" }
    it { should_not be_valid }
  end

  describe "with a non-numeric price" do
    before { @product.price = "string" }
    it { should_not be_valid }
  end

  describe "with a non-numeric on_sale" do
    before { @product.on_sale = "string" }
    it { should_not be_valid }
  end

  describe "with invalid qty" do
    before { @product.qty = -1 }
    it { should_not be_valid }
  end

  describe "with invalid price" do
    before { @product.price = -1 }
    it { should_not be_valid }
  end

  describe "with invalid on_sale" do
    before { @product.on_sale = "other" }
    it { should_not be_valid }
  end

  describe "with invalid low sale_price" do
    before { @product.sale_price = -1 }
    it { should_not be_valid }
  end

  describe "with invalid high sale_price" do
    before { @product.sale_price = @product.price + 1 }
    it { should_not be_valid }
  end
end
