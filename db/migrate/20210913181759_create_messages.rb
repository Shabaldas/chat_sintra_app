class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :mailer, index: true, foreign_key: { to_table: :users }
      t.references :receiver, index: true, polymorphic: true
      t.boolean :visible

      t.timestamps
    end
  end
end
