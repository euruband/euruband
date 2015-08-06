class AddPerformanceToStages < ActiveRecord::Migration
  def change
    add_column :stages, :performance, :text
  end
end
