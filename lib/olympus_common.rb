# frozen_string_literal: true

require 'olympus_common/version'
require 'olympus_common/connections/connection'
require 'olympus_common/connections/ssh_connection'
require 'olympus_common/errors/error'
require 'olympus_common/extensions/string'
require 'olympus_common/extensions/hash'
require 'olympus_common/logs/log'
require 'olympus_common/yaml_parser'

module OlympusCommon
  class Error < StandardError; end

=begin
  class Common
    class << self
      def connection
        OlympusCommon::Connection::Connection
      end

      def internal_error
        OlympusCommon::Errors::Internal
      end

      def log
        OlympusCommon::Logs::Log
      end

      def ssh_connection
        OlympusCommon::Connection::SshConnection
      end

      def yaml_parser
        OlympusCommon::YamlParser
      end
    end
  end
=end
end
