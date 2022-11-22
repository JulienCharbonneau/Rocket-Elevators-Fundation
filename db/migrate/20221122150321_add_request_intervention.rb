class AddRequestIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :request_intervention do |t|
      t.string :author
      t.integer :customer_id
      t.integer :building_id
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.integer :employee_id
      t.date :start_date
      t.date :end_date
      t.string :result, :default =>  "Incomplete "
      t.text :report
      t.string :status, :default =>  "Pending"
    end
  end
end
