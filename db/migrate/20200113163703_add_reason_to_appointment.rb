class AddReasonToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :reason, :string
  end
end
