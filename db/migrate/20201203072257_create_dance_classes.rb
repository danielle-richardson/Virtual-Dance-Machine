class CreateDanceClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :dance_classes do |t|
      t.string :type
      t.string :description
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :dancer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
