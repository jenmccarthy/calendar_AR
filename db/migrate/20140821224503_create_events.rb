class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.column :description, :string
      t.column :location, :string
      t.column :start_date, :timestamp
      t.column :end_date, :timestamp

      t.timestamps
    end
  end
end
