module Refinery
  module Brothers
    class BrothersController < ::ApplicationController

      before_filter :find_all_brothers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @brother in the line below:
        present(@page)
      end

      def show
        @brother = Brother.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @brother in the line below:
        present(@page)
      end

    protected

      def find_all_brothers
        @brothers = Brother.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/brothers").first
      end

    end
  end
end
