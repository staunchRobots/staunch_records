class AddFirstNameAndLastNameAndBirthdayAndCountryToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string

    add_column :users, :last_name, :string

    add_column :users, :birthday, :date

    add_column :users, :country, :string

  end
end
