class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :body
      t.boolean :status, :default => false

      t.timestamps null: false
    end
  end
end
