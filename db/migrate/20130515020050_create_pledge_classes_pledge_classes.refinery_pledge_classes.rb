# This migration comes from refinery_pledge_classes (originally 1)
class CreatePledgeClassesPledgeClasses < ActiveRecord::Migration

  def up
    create_table :refinery_pledge_classes do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pledge_classes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pledge_classes/pledge_classes"})
    end

    drop_table :refinery_pledge_classes

  end

end
