require File.dirname(__FILE__) + '/spec_helper'


describe Validator do


  describe "Validator.nu" do

    it "should pass some test" do
      Validator.nu("this_is_not_a_url").should == "test"
    end

  end
 
end
