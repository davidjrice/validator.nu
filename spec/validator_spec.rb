require File.dirname(__FILE__) + '/spec_helper'


describe Validator do

  def fixture(file)
    path = "#{File.dirname(__FILE__)}/fixtures"
    file = File.open("#{path}/#{file}.json").read

    parser = Yajl::Parser.new
    parser.parse(file)
  end

  def post_fixture(file)
    path = "#{File.dirname(__FILE__)}/fixtures"
    file = File.open("#{path}/#{file}.json").read

    if RUBY_VERSION != '1.8.7'
      file = file.force_encoding('ASCII-8BIT')
    end

    file
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
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/no-message.html").read

      Validator.nu(html_fixture).should == post_fixture('no-message-post')
    end

    it "should receive an info result" do
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

      Validator.nu(html_fixture, {
        :content_type => 'image/svg+xml'
      }).should == post_fixture('info-post')
    end

    it "should receive a warning result" do
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/warning.html").read

      Validator.nu(html_fixture).should == post_fixture('warning-post')
    end

    it "should receive a precise error result" do
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/precise-error.html").read

      Validator.nu(html_fixture).should == post_fixture('precise-error-post')
    end

    it "should receive a range error result" do
      html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/range-error.html").read

      Validator.nu(html_fixture).should == post_fixture('range-error-post')
    end

    it "should receive a fatal error result" do
     html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/fatal-error.html").read
      Validator.nu( html_fixture, {
        :content_type => 'application/xhtml+xml'
      }).should == post_fixture('fatal-error-post')
    end

  end

  it "Validator.nu posting with gzip" do
    html_fixture = File.open("#{File.dirname(__FILE__)}/fixtures/info.svg").read

    Validator.nu(html_fixture, {
      :content_type => 'image/svg+xml', :gzip => true
    }).should == post_fixture('info-post')

  end

end
