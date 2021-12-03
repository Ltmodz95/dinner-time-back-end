class RenameCreateTagsColumnInTags < ActiveRecord::Migration[6.1]
  def change
    rename_column :tags, :CreateTags, :name
  end
end
