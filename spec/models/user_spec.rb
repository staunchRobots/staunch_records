require 'spec_helper'

describe User do

  before { @user = User.new(email: "sebasoga@example.com", password: "example", password_confirmation: "example", first_name: "Sebastian", last_name: "Sogamoso") }

  subject { @user }

  %w(email password password_confirmation remember_me first_name last_name birthday country admin).each do |field|
    it { should respond_to(field) }
  end

  it { should be_valid }

  describe "with blank email" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "with blank password" do
    before { @user.password = " " }
    it { should_not be_valid }
  end

  describe "with blank password_confirmation" do
    before { @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "with invalid email" do
    invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe "with valid email" do
    valid_addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "with a password that's too long" do
    before { @user.password = @user.password_confirmation = "a" * 21 }
    it { should be_invalid }
  end

  describe "with invalid admin value" do
    before { @user.admin = "yes" }
    it { should_not be_invalid }
  end
 
end
