class CreateColors < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :hex_code
      t.boolean :locked
      t.references :palette, null: false, foreign_key: true

      t.timestamps
    end
  end
end
