class CreateCountryActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :country_activities do |t|
      t.references :country, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
