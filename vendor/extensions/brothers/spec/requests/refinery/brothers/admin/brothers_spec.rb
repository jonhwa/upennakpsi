# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Brothers" do
    describe "Admin" do
      describe "brothers" do
        login_refinery_user

        describe "brothers list" do
          before do
            FactoryGirl.create(:brother, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:brother, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.brothers_admin_brothers_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.brothers_admin_brothers_path

            click_link "Add New Brother"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Brothers::Brother.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("First Name can't be blank")
              Refinery::Brothers::Brother.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:brother, :first_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.brothers_admin_brothers_path

              click_link "Add New Brother"

              fill_in "First Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Brothers::Brother.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:brother, :first_name => "A first_name") }

          it "should succeed" do
            visit refinery.brothers_admin_brothers_path

            within ".actions" do
              click_link "Edit this brother"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            page.should have_content("'A different first_name' was successfully updated.")
            page.should have_no_content("A first_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:brother, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.brothers_admin_brothers_path

            click_link "Remove this brother forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Brothers::Brother.count.should == 0
          end
        end

      end
    end
  end
end
