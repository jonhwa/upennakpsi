module Refinery
  module PledgeClasses
    class PledgeClass < Refinery::Core::BaseModel
      self.table_name = 'refinery_pledge_classes'

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      has_many :brothers, :class_name => '::Refinery::Brothers::Brother'
    end
  end
end
