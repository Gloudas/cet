class CreateProjectsUsers < ActiveRecord::Migration
  def up
    create_table :projects_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end

  def down
  end
end
