class CreateEvenAttendees < ActiveRecord::Migration[7.1]
  def change
    create_table :even_attendees do |t|
      t.references :event, null: false, foreign_key: true
      t.references :attendee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
