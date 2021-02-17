class CreateChildComments < ActiveRecord::Migration[6.0]
  def change
    create_table :child_comments do |t|
      t.string :commenter
      t.text :body
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
