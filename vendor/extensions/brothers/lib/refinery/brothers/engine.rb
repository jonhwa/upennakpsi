module Refinery
  module Brothers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Brothers

      engine_name :refinery_brothers

      initializer "register refinerycms_brothers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "brothers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.brothers_admin_brothers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/brothers/brother',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Brothers)
      end
    end
  end
end
