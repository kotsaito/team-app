class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime   :start_time,        null: false
      t.string     :title,             null: false
      t.string     :place  
      t.string     :person
      t.text       :practice
      t.text       :others
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
