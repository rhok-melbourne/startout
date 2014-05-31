class AddTypeQuestionToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :entry_type, :string
    add_column :entries, :question, :string
  end
end
