module Refinery
  module Brothers
    module Admin
      class BrothersController < ::Refinery::AdminController

        crudify :'refinery/brothers/brother',
                :title_attribute => 'first_name', :xhr_paging => true

      end
    end
  end
end
