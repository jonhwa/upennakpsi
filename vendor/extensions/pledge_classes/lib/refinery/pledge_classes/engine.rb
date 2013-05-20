module Refinery
  module PledgeClasses
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::PledgeClasses

      engine_name :refinery_pledge_classes

      initializer "register refinerycms_pledge_classes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pledge_classes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pledge_classes_admin_pledge_classes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/pledge_classes/pledge_class',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PledgeClasses)
      end
    end
  end
end
