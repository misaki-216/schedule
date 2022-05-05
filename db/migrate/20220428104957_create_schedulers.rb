class CreateSchedulers < ActiveRecord::Migration[6.1]
  def change
    create_table :schedulers do |t|
      t.string :title
      t.date :start
      t.date :end
      t.string :allday
      t.string :memo

      t.timestamps
    end
  end
end
