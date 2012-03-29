require 'spec_helper'

describe Category do
  
  before { @category = Category.new(name: "Rock", color: "grey") }

  subject { @category }

  it { should respond_to :name }
  it { should respond_to :color }

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
