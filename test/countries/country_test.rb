require 'test_helper'

class CountryTest < Test::Unit::TestCase
  should "include 'Common Methods' module" do
    assert_contains Decoder::State.included_modules, CommonMethods
  end

  context "English for US" do
    setup do
      Decoder.i18n = :en
    end

    context "A new country" do
      should "load the yaml" do
        Decoder.expects(:load_yaml).returns({:en => {"US" => {:name => "United States", :states => {"MA" => "Massachusetts"}}}})

        country = Decoder::Country.new(:code => "US", :name => "United States")
        assert_not_nil country.states
      end
    end

    context "Getting a state" do
      setup do
        @country = Decoder::Country.new(:code => "US", :name => "United States")
      end

      should "return a state object of \"Massachusetts\" for :MA" do
        state = @country[:MA]
        assert_equal Decoder::State, state.class
      end

      should "return a state object of \"Massachusetts\" for :ma" do
        state = @country[:ma]
        assert_equal Decoder::State, state.class
      end

      should "return a state object of \"Massachusetts\" for \"MA\"" do
        state = @country["MA"]
        assert_equal Decoder::State, state.class
      end

      should "return a state object of \"Massachusetts\" for \"ma\"" do
        state = @country["ma"]
        assert_equal Decoder::State, state.class
      end

    end

    context "#states" do
      setup do
        @country = Decoder::Country.new(:code => "US", :name => "United States")
      end

      should "a hash of states" do
        assert_equal "Massachusetts", @country.states["MA"]
      end

      context "aliases" do
        should "be equal for #states and #counties" do
          assert_equal @country.states, @country.counties
        end

        should "be equal for #states and #provinces" do
          assert_equal @country.states, @country.provinces
        end

        should "be equal for #states and #territories" do
          assert_equal @country.states, @country.territories
        end
      end
    end

  end

end