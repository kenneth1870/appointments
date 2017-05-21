class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: { on_delete: :cascade }
      t.date :date

      t.timestamps
    end
  end
end
