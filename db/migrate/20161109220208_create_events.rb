class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :event_date
      t.string :resource
      t.string :user

      t.timestamps
    end
  end
end
