class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :phone

      t.timestamps
    end
  end
end
