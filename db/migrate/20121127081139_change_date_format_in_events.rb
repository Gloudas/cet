class ChangeDateFormatInEvents < ActiveRecord::Migration
  def up
   change_column :events, :time, :datetime
  end

  def down
   change_column :events, :time, :time
  end
end
