require 'spec_helper'

describe Product do
  
  let(:category) { FactoryGirl.create(:category) }
  before { @product = category.products.build(album: "Hey Jude", artist: "The Beatles", qty: 1, price: 1000.00, on_sale: :true, sale_price: 900.99) }

  subject { @product }

  %w(album artist qty description price on_sale sale_price category_id category).each do |field|
    it { should respond_to(field) }
  end

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
