class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :tittle
      t.string :description
      t.integer :score
      t.belongs_to :lenguaje, null: false, foreign_key: true

      t.timestamps
    end
  end
end