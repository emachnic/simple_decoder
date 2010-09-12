module Decoder
  class Country
    include ::CommonMethods
    attr_accessor :code, :name

    def initialize(args)
      self.code   = args[:code].to_s
      self.name   = args[:name]
      self.states = Decoder.locale[Decoder.i18n][self.code][:states]
    end

    def states
      @states
    end

    def states=(_states)
      @states = _states
    end

    alias_method :counties, :states
    alias_method :provinces, :states
    alias_method :territories, :states

    def [](_code)
      _code = _code.to_s.upcase
      state = states[_code]
      if state.is_a?(Array)
        fips  = state.last
        state = state.first
      end
      Decoder::State.new(:code => _code, :name => state, :fips => fips)
    end
    
    def by_fips(fips)
      fips = fips.to_s
      state = states.detect { |k,v| v.include?(fips) if v.is_a?(Array) }
      self[state.first]
    end
  end
end