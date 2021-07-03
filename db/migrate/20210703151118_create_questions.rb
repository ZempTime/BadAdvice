class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :author
      t.string :note, null: false
      t.inet :ip
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
