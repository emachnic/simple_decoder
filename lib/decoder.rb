require 'yaml'
require 'common_methods'
require 'decoder/countries'
require 'decoder/country'
require 'decoder/state'

module Decoder

  def self.i18n
    @i18n ||= :en
  end

  def self.i18n=(code)
    @i18n = code
    self.locale = nil
  end

  def self.locale
    @locale || self.locale = self.load_yaml
  end

  def self.locale=(_locale)
    @locale = _locale
  end

  def self.load_yaml
    Decoder.locale = YAML.load_file(yaml_file_name)
  end

  def self.yaml_file_name
    "#{File.dirname(__FILE__)}/locales/#{Decoder.i18n}.yml"
  end

end