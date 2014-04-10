class CreateErrands < ActiveRecord::Migration
  def change
    create_table :errands do |t|
      t.string :business_name
      t.float :latitude
      t.float :longitude
      t.text :address
      t.integer :additional_duration   
      belongs_to :route
    end
  end
end
