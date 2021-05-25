require File.expand_path('../../connections/connection.rb', __FILE__)

module OlympusCommon
    module Logs
        class Log
            # @return [String]
            attr_accessor :name
    
            # @return [String]
            attr_accessor :path
    
            # @return [String]
            attr_accessor :command
    
            # @return [Boolean]
            attr_accessor :superUser
    
            # @return [SshConnection]
            attr_accessor :connection
    
            # @return [Boolean]
            attr_writer :gzip
    
            # @return [Boolean]
            def gzip
                @gzip || true
            end
    
            # @return [Boolean]
            def super_user
                @superUser || false
            end
    
            def initialize(args)
                @path = args['path']
                @name = args['name']
                @command = args['command']
                @superUser = args['superUser']
                @connection = OlympusCommon::Connections::SshConnection.new(args['connection'])
            end
        end
    end
end