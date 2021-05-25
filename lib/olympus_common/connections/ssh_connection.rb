# frozen_string_literal: true

#require 'olympus_common/connections/connection'
require File.expand_path('../connection.rb', __FILE__)

module OlympusCommon
    module Connections

        # SSH connection object. This isn't part of the SSH gem because it's
        # used for the jump host settings, which makes it a common object
        
        class SshConnection < Connection
            attr_writer :options
            attr_writer :port
    
            def port
                @port || 22
            end
    
            def options
                @options || {}
            end
    
            def to_net_ssh
                options = @options.to_h || {}
    
                [@host, @user, options.merge(
                    password: @password,
                    port: @port
                )]
            end
        end
    end
end
  