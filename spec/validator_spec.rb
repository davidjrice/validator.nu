require File.dirname(__FILE__) + '/spec_helper'


describe Validator do


  describe "Validator.nu" do

   it "should receive a no message result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message.json").read

      Validator.nu(
      "http://hsivonen.iki.fi/test/moz/messages-types/no-message.html"
      ).should == fixture
    end

    # http://hsivonen.iki.fi/test/moz/messages-types/info.svg
    it "should receive an info result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.json").read


      Validator.nu(
      "http://hsivonen.iki.fi/test/moz/messages-types/info.svg"
      ).should == fixture
    end

    it "should receive a warning result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning.json").read


      Validator.nu(
      "http://hsivonen.iki.fi/test/moz/messages-types/warning.html"
      ).should == fixture
    end

    it "should receive a non-document result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/non-document-error.json").read


      Validator.nu(
      "http://hsivonen.iki.fi/test/moz/messages-types/404.html"
      ).should == fixture
    end

    it "should receive a precise error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error.json").read

      Validator.nu(
      "http://hsivonen.iki.fi/test/moz/messages-types/precise-error.html"
      ).should == fixture
    end

    it "should receive a range error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error.json").read
      Validator.nu(
      "http://hsivonen.iki.fi/test/moz/messages-types/range-error.html"
      ).should == fixture
    end

    it "should receive a fatal error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error.json").read
      Validator.nu(
        "http://hsivonen.iki.fi/test/moz/messages-types/fatal.xhtml"
      ).should == fixture
    end
  end
end
