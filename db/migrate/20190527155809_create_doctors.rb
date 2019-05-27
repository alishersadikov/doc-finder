class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :title
      t.string :specialties, array: true
      t.string :insurances, array: true
      t.boolean :primary_care_physician

      t.timestamps
    end
  end
end
