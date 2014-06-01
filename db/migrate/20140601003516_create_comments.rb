class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :entry
      t.belongs_to :relationship
      t.belongs_to :author
      t.datetime :created_at
      t.string :text

      t.timestamps
    end
  end
end
