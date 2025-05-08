class CreateCountries < ActiveRecord::Migration[8.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.string :continent
      t.string :score_letter_rating
      t.decimal :ccpi_score
      t.text :description
      t.string :image_url

      t.timestamps
    end
    add_index :countries, :code
  end
end
