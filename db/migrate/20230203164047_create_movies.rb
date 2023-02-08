# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false, unique: true
      t.string :genre
      t.string :thumbnail
      t.string :image
      t.string :owner
      t.string :market_price

      t.timestamps
    end
  end
end
