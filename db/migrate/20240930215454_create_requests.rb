class CreateRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :prompt
      t.text :files
      t.text :result

      t.timestamps
    end
  end
end
