class AddRequestInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :request_interventions do |t|
      t.integer :author, null: false
      t.integer :customer_id, null: false
      t.integer :building_id, null: false
      t.integer :battery_id, null: false
      t.integer :column_id
      t.integer :elevator_id
      t.integer :employee_id, null: false
      t.date :start_date
      t.date :end_date
      t.string :result, :default =>  "Incomplete "
      t.text :report, null: false
      t.string :status, :default =>  "Pending"
    end
  end
end
