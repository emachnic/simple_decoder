module Decoder
  class State
    include ::CommonMethods
    attr_accessor :code, :name, :fips

    def initialize(args)
      self.code = args[:code].to_s
      self.name = args[:name]
      self.fips = args[:fips].to_i if args[:fips]
    end
  end
end