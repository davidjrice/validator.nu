require File.dirname(__FILE__) + '/spec_helper'


describe Validator do

  def fixture(file)
    path = "#{File.dirname(__FILE__)}/fixtures"
    file = File.open("#{path}/#{file}.json").read

    parser = Yajl::Parser.new
    parser.parse(file)
  end

  describe "Validator.nu, get -ing" do

   it "should receive a no message result" do
      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/no-message.html")
      ).should == fixture('no-message')
    end

    # http://hsivonen.iki.fi/test/moz/messages-types/info.svg
    it "should receive an info result" do
      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/info.svg")
      ).should == fixture('info')
    end

    it "should receive a warning result" do
      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/warning.html")
      ).should == fixture('warning')
    end

    it "should receive a non-document result" do
      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/404.html")
      ).should == fixture('non-document-error')
    end

    it "should receive a precise error result" do
      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/precise-error.html")
      ).should == fixture('precise-error')
    end

    it "should receive a range error result" do
      Validator.nu(
      URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/range-error.html")
      ).should == fixture('range-error')
    end

    it "should receive a fatal error result" do
      Validator.nu(
        URI.parse("http://hsivonen.iki.fi/test/moz/messages-types/fatal.xhtml")
      ).should == fixture('fatal-error')
    end

  end

  describe "Validator.nu, post -ing" do

   it "should receive a no message result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message.html").read

      Validator.nu(html_fixture).force_encoding("UTF-8").should == fixture
    end

    it "should receive an info result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

      Validator.nu(html_fixture, {
        :content_type => 'image/svg+xml'
      }).force_encoding("UTF-8").should == fixture
    end

    it "should receive a warning result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning.html").read

      Validator.nu(html_fixture).force_encoding("UTF-8").should == fixture
    end

    it "should receive a precise error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error.html").read

      Validator.nu(html_fixture).force_encoding("UTF-8").should == fixture
    end

    it "should receive a range error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error.html").read

      Validator.nu(html_fixture).force_encoding("UTF-8").should == fixture
    end

    it "should receive a fatal error result" do
      fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error-post.json").read
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error.html").read
      Validator.nu( html_fixture, {
        :content_type => 'application/xhtml+xml'
      }).force_encoding("UTF-8").should == fixture
    end

  end

  it "Validator.nu posting with gzip" do
    fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info-post.json").read
    html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

    Validator.nu(html_fixture, {
      :content_type => 'image/svg+xml', :gzip => true
    }).force_encoding("UTF-8").should == fixture

  end

end
