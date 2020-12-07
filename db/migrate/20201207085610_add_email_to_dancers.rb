class AddEmailToDancers < ActiveRecord::Migration[6.0]
  def change
    add_column :dancers, :email, :string
  end
end
