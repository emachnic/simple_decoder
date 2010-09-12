require 'test_helper'

class StateTest < Test::Unit::TestCase

  should "include 'Common Methods' module" do
    assert_contains Decoder::State.included_modules, CommonMethods
  end

  context "English" do
    setup do
      Decoder.i18n = :en
    end

    context "Getters" do
      setup do
        @state = Decoder::State.new(:code => "MA", :name => "Massachusetts")
      end

      should "return 'Massachusetts' for #name" do
        assert_equal "Massachusetts", @state.name
      end

      should "return \"MA\" for #code" do
        assert_equal "MA", @state.code
      end
    end
    
    context "FIPS states from a country" do
      setup do 
        @country = Decoder::Countries["US"]
        @state   = @country["MA"]
      end
      
      should "properly assign the name" do
        assert_equal "Massachusetts", @state.name
      end
      
      should "properly assign the fips" do
        assert_equal 25, @state.fips
      end
    end
  end

end