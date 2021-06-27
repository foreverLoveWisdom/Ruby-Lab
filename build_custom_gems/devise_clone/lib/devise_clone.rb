# frozen_string_literal: true

require_relative "devise_clone/version"

module DeviseClone
  class Error < StandardError; end
  # Constants which holds devise configuration for extensions. Those should
  # not be modified by the "end user" (this is why they are constants).
  ALL         = [].freeze
  CONTROLLERS = {}.freeze
  ROUTES      = {}.freeze
  STRATEGIES  = {}.freeze
  URL_HELPERS = {}.freeze

  # Strategies that do not require user input.
  NO_INPUT = []

  # True values used to check params
  TRUE_VALUES = [true, 1, "1", "t", "T", "true", "TRUE"].freeze

  # Secret key used by the key generator
  mattr_accessor :secret_key
  @@secret_key = nil
end
