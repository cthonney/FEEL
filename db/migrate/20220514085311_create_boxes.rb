class CreateBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
