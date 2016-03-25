class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.text :content
      t.references :user
      t.references :stage
      t.timestamps
    end
  end
end
