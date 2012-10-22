class CreateUsers < ActiveRecord::Migration
  def up
    create_table "users" do |t|
      t.integer "uid"
      t.string "name"
      t.string "email"
    end
  end

  def down
  end
end
