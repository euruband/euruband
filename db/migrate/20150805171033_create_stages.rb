class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :title
      t.text   :description, default: ''

      t.references :user
      t.timestamps
    end
  end
end
