class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change

     add_column :users, :votes_up, :integer , default: 0
     add_column :users, :votes_down, :integer , default: 0
     add_column :users, :average_rating, :float , default: 0.0


  end
end
