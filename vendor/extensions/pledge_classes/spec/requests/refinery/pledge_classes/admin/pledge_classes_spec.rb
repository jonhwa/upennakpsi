# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "PledgeClasses" do
    describe "Admin" do
      describe "pledge_classes" do
        login_refinery_user

        describe "pledge_classes list" do
          before do
            FactoryGirl.create(:pledge_class, :name => "UniqueTitleOne")
            FactoryGirl.create(:pledge_class, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.pledge_classes_admin_pledge_classes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.pledge_classes_admin_pledge_classes_path

            click_link "Add New Pledge Class"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::PledgeClasses::PledgeClass.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::PledgeClasses::PledgeClass.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:pledge_class, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.pledge_classes_admin_pledge_classes_path

              click_link "Add New Pledge Class"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::PledgeClasses::PledgeClass.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:pledge_class, :name => "A name") }

          it "should succeed" do
            visit refinery.pledge_classes_admin_pledge_classes_path

            within ".actions" do
              click_link "Edit this pledge class"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:pledge_class, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.pledge_classes_admin_pledge_classes_path

            click_link "Remove this pledge class forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::PledgeClasses::PledgeClass.count.should == 0
          end
        end

      end
    end
  end
end
