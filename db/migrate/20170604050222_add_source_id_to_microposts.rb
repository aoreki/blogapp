class AddSourceIdToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :source_id, :integer
  end
end
