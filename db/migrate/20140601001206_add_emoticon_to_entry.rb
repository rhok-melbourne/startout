class AddEmoticonToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :emoticon, :string
  end
end
