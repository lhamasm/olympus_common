# frozen_string_literal: true

#require 'olympus_common/connections/ssh_connection'
require File.expand_path('../connection.rb', __FILE__)
require 'logging'

module OlympusCommon
    module Connections
        # Base object for connection parameters
        class Connection
            @@logger = Logging.logger[self]
            @@logger.add_appenders(Logging.appenders.stdout)

            # @return [String]
            attr_accessor :uri
    
            # @return [String]
            attr_accessor :scheme
    
            # @return [String]
            attr_accessor :host
    
            # @return [Number]
            attr_accessor :port
    
            # @return [String]
            attr_accessor :path
    
            # @return [String]
            attr_accessor :user
    
            # @return [String]
            attr_accessor :password
    
            # @return [OlympusCommon::SshConnection]
            attr_accessor :jumpHost
    
            # @return [String]
            attr_accessor :peerId
    
            # @param [Hash]
            def initialize(hash)
                load_uri(hash['uri']) unless hash['uri'].nil?
                hash.each do |k, v|
                    if k == 'jumpHost'
                        @jumpHost = SshConnection.new(v)
                    elsif respond_to?(k)
                        instance_variable_set("@#{k}", v)
                    end
                end
            end
    
            # @return [Connection]
            def resolve
                return self if @jumpHost.nil?
    
                jump_host = @jumpHost.resolve
    
                if Gem.loaded_specs.key?('olympus_ssh')
                    gateway = OlympusSSH::Gateway.new(*jump_host.to_net_ssh)
                else
                    @@logger.error 'Could not connect to the jump host because olympus_ssh gem is missing.'
                    return self
                end

                local_port = gateway.create_tunnel(@host, @port)
        
                new_connection = dup
                new_connection.host = 'localhost'
                new_connection.port = local_port
        
                new_connection
            end
    
            private
    
            def load_uri(uri)
                uri_obj = URI.parse(uri)
                @scheme = uri_obj.scheme
                @user = uri_obj.user
                @password = uri_obj.password
                @host = uri_obj.host
                @port = uri_obj.port
                @path = uri_obj.path
            end  
        end
    end
end
  