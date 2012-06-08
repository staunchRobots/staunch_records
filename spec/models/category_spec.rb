require 'spec_helper'

describe Category do

  before { @category = Category.new(name: "Rock", color: "grey") }
  subject { @category }

  %w(name color).each do |field|
    it { should respond_to(field) }
  end

  it { should be_valid }

  describe "with blank name" do
    before { @category.name = " " }
    it { should_not be_valid }
  end

  describe "with blank color" do
    before { @category.color = " " }
    it { should_not be_valid }
  end
end
