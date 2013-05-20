module Refinery
  module Brothers
    class Brother < Refinery::Core::BaseModel
		self.table_name = 'refinery_brothers'

		attr_accessible :first_name, :last_name, :photo_id, :pledgeclass_id, :position

		acts_as_indexed :fields => [:first_name, :last_name]

		validates :first_name, :presence => true, :uniqueness => true

		belongs_to :photo, :class_name => '::Refinery::Image'
    	belongs_to :pledgeclass, :class_name => '::Refinery::PledgeClasses::PledgeClass'
    end
  end
end
