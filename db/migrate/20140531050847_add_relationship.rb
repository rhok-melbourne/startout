class AddRelationship < ActiveRecord::Migration

  def change

    create_table(:relationships) do |t|
      t.integer  :mentor_id, null: false
      t.integer  :mentee_id, null: false
    end

    create_table(:entries) do |t|
      t.belongs_to :relationship
      t.belongs_to :author
      t.string :text
      t.datetime :created_at, :null => false, :default => Time.now
    end

  end
end
