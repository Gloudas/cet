class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :time
      t.references :school
      t.timestamps
    end
  end
end
