class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.column :animal, :string
    end
  end
end
