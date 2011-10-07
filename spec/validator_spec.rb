require File.dirname(__FILE__) + '/spec_helper'


describe Validator do

  def json_fixture(file)
    # file = File.new("#{File.dirname(__FILE__)}/fixtures/#{file}", 'r')
    # parser = Yajl::Parser.new
    # parser.parse(file)
    JSON.parse(File.open("#{File.dirname(__FILE__)}/fixtures/#{file}").read)
  end


  describe "Validator.nu, get -ing" do

   it "should receive a no message result" do
      fixture = json_fixture("no-message.json")

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/no-message.html")
      ).should == fixture
    end

    # http://hsivonen.iki.fi/test/moz/messages-types/info.svg
    it "should receive an info result" do
      fixture = json_fixture("info.json")

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/info.svg")
      ).should == fixture
    end

    it "should receive a warning result" do
      fixture = json_fixture("warning.json")

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/warning.html")
      ).should == fixture
    end

    it "should receive a non-document result" do
      fixture = json_fixture("non-document-error.json")

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/404.html")
      ).should == fixture
    end

    it "should receive a precise error result" do
      fixture = json_fixture("precise-error.json")

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/precise-error.html")
      ).should == fixture
    end

    it "should receive a range error result" do
      fixture = json_fixture("range-error.json")

      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/range-error.html")
      ).should == fixture
    end

    it "should receive a fatal error result" do
      fixture = json_fixture("fatal-error.json")

      Validator.nu(
        URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/fatal.xhtml")
      ).should == fixture
    end

  end

  describe "Validator.nu, post -ing" do

    it "should receive a no message result" do
      fixture = json_fixture("no-message-post.json")
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive an info result" do
      fixture = json_fixture("info-post.json")

      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

      Validator.nu(html_fixture, :content_type => 'image/svg+xml').should == fixture
    end

    it "should receive a warning result" do
      fixture = json_fixture("warning-post.json")
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive a precise error result" do
      fixture = json_fixture("precise-error-post.json")
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive a range error result" do
      fixture = json_fixture("range-error-post.json")
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error.html").read

      Validator.nu(html_fixture).should == fixture
    end

    it "should receive a fatal error result" do
      fixture = json_fixture("fatal-error-post.json")
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error.html").read

      Validator.nu( html_fixture, :content_type => 'application/xhtml+xml').should == fixture
    end

  end

  it "Validator.nu posting with gzip" do
    pending
    fixture = json_fixture("info-post.json")
    html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

    Validator.nu(html_fixture, :content_type => 'image/svg+xml', :gzip => true).should == fixture

  end

end
