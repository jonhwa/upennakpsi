module Refinery
  module PledgeClasses
    class PledgeClassesController < ::ApplicationController

      before_filter :find_all_pledge_classes
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pledge_class in the line below:
        present(@page)
      end

      def show
        @pledge_class = PledgeClass.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pledge_class in the line below:
        present(@page)
      end

    protected

      def find_all_pledge_classes
        @pledge_classes = PledgeClass.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pledge_classes").first
      end

    end
  end
end
