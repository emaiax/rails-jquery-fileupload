class AddTokenFields < ActiveRecord::Migration
  def change
    add_column :products, :token, :string
    add_column :pictures, :token, :string
  end
end
