class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.time :time
      t.date :date
      t.references :school
      t.timestamps
    end
  end
end
