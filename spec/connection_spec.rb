# frozen_string_literal: true

RSpec.describe OlympusCommon::Connections::Connection do
    it 'create Connection instance without jump host' do
        hash = {
            'uri' => 'http://127.0.0.0:7000'
        }

        connection = OlympusCommon::Connections::Connection.new(hash)

        expect(connection.instance_variable_get('@uri')).to eq('http://127.0.0.0:7000')
        expect(connection.instance_variable_get('@scheme')).to eq('http')
        expect(connection.instance_variable_get('@user')).to be_nil
        expect(connection.instance_variable_get('@password')).to be_nil
        expect(connection.instance_variable_get('@host')).to eq('127.0.0.0')
        expect(connection.instance_variable_get('@port')).to eq(7000)
        expect(connection.instance_variable_get('@path')).to eq('')
    end

    it 'create Connection instance with jump host' do
        hash = {
            'uri' => 'http://127.0.0.0:7000',
            'jumpHost' => {
                'host' => '127.0.0.0',
                'port' => 22,
                'user' => 'user',
                'password' => '123qwe'
            }
        }
        
        connection = OlympusCommon::Connections::Connection.new(hash)
        expect(connection.instance_variable_get('@uri')).to eq('http://127.0.0.0:7000')
        expect(connection.instance_variable_get('@scheme')).to eq('http')
        expect(connection.instance_variable_get('@user')).to be_nil
        expect(connection.instance_variable_get('@password')).to be_nil
        expect(connection.instance_variable_get('@host')).to eq('127.0.0.0')
        expect(connection.instance_variable_get('@port')).to eq(7000)
        expect(connection.instance_variable_get('@path')).to eq('')

        jump_host = connection.instance_variable_get('@jumpHost')
        expect(jump_host.instance_variable_get('@scheme')).to be_nil
        expect(jump_host.instance_variable_get('@user')).to eq('user')
        expect(jump_host.instance_variable_get('@password')).to eq('123qwe')
        expect(jump_host.instance_variable_get('@host')).to eq('127.0.0.0')
        expect(jump_host.instance_variable_get('@port')).to eq(22)
        expect(jump_host.instance_variable_get('@path')).to be_nil
    end

    it 'resolve connection without jumphost' do
        hash = {
            'uri' => 'http://127.0.0.0:7000'
        }

        connection = OlympusCommon::Connections::Connection.new(hash)
        result = connection.resolve
        expect(result.class.to_s).to eq('OlympusCommon::Connections::Connection')
    end

    it 'resolve connection with jumphost' do
        hash = {
            'uri' => 'http://127.0.0.0:7000',
            'jumpHost' => {
                'host' => '127.0.0.0',
                'port' => 22,
                'user' => 'user',
                'password' => '123qwe'
            }
        }
        
        connection = OlympusCommon::Connections::Connection.new(hash)
        result = connection.resolve
        expect(result.class.to_s).to eq('OlympusCommon::Connections::Connection')
    end
end  