class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :breed
      t.integer :weight
      t.integer :owner_id

      t.timestamps
    end
  end
end
