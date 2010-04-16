require File.dirname(__FILE__) + '/spec_helper'


describe Validator do


  describe "Validator.nu, get -ing" do

   it "should receive a no message result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message.json").read

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/no-message.html")
      ).should == fixture
    end

    # http://hsivonen.iki.fi/test/moz/messages-types/info.svg
    it "should receive an info result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.json").read


      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/info.svg")
      ).should == fixture
    end

    it "should receive a warning result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning.json").read


      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/warning.html")
      ).should == fixture
    end

    it "should receive a non-document result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/non-document-error.json").read


      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/404.html")
      ).should == fixture
    end

    it "should receive a precise error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error.json").read

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/precise-error.html")
      ).should == fixture
    end

    it "should receive a range error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error.json").read
      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/range-error.html")
      ).should == fixture
    end

    it "should receive a fatal error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error.json").read
      Validator.nu(
        URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/fatal.xhtml")
      ).should == fixture
    end

  end

  describe "Validator.nu, post -ing" do

   it "should receive a no message result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive an info result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

      Validator.nu(html_fixture, :content_type => 'image/svg+xml').should == fixture
    end

    it "should receive a warning result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive a precise error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive a range error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive a fatal error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error.html").read
      Validator.nu( html_fixture, :content_type => 'application/xhtml+xml').should == fixture
    end

  end

  it "Validator.nu posting with gzip" do
    fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info-post.json").read
    html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

    Validator.nu(html_fixture, :content_type => 'image/svg+xml', :gzip => true).should == fixture

  end

end
