class CreateProjectsUsers < ActiveRecord::Migration
  def up
    create_table :projects_users do |t|
      t.references :project
      t.references :user
    end
  end

  def down
  end
end
