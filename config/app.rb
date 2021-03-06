# frozen_string_literal: true

require 'logger'
require 'pathname'

# Encapsulates app configuration
module App
  class << self
    attr_reader :logger, :version, :released_at

    def env
      ENV['RACK_ENV'] || 'development'
    end

    def root
      Pathname.pwd
    end
  end

  @logger = Logger.new(STDOUT)
  @version = `git rev-parse --short HEAD 2>/dev/null`.strip!
  @released_at = `git show -s --format=%ci HEAD`
end
