module Refinery
  module PledgeClasses
    module Admin
      class PledgeClassesController < ::Refinery::AdminController

        crudify :'refinery/pledge_classes/pledge_class',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
