class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :place
      t.string :time

      t.timestamps
    end
  end
end
