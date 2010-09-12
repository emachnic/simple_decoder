require 'test_helper'

class CountriesTest < Test::Unit::TestCase
  should "print '#<#class>" do
    assert_equal "#<Decoder::Countries>", Decoder::Countries.new.inspect
  end

  context "English" do
    setup do
      Decoder.i18n = :en
    end

    context "A new object" do
      should "load the yaml" do
        Decoder.expects(:load_yaml).returns({:en => {"US" => {:name => "United States", :states => {"MA" => "Massachusetts"}}}})
        countries = Decoder::Countries.new
        assert_not_nil countries.countries
      end
    end

    context "Getting a country" do
      setup do
        @countries = Decoder::Countries.new
      end

      should "return a country object of \"United States\" for :US" do
        country = @countries[:US]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for :us" do
        country = @countries[:us]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"US\"" do
        country = @countries["US"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"us\"" do
        country = @countries["us"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

    end

    context "Getting a country alternate form" do

      should "return a country object of \"United States\" for :US" do
        country = Decoder::Countries[:US]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for :us" do
        country = Decoder::Countries[:us]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"US\"" do
        country = Decoder::Countries["US"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

      should "return a country object of \"United States\" for \"us\"" do
        country = Decoder::Countries["us"]
        assert_equal Decoder::Country, country.class
        assert_equal "United States", country.to_s
      end

    end

  end

end