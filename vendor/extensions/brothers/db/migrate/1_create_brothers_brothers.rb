class CreateBrothersBrothers < ActiveRecord::Migration

  def up
    create_table :refinery_brothers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :photo_id
      t.integer :position
      t.belongs_to :pledge_class

      t.timestamps
    end
    add_index :brothers, :pledge_class_id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-brothers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/brothers/brothers"})
    end

    drop_table :refinery_brothers

  end

end
