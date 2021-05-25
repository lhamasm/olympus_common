# frozen_string_literal: true

RSpec.describe OlympusCommon::Logs::Log do
    it 'create Log instance' do
        hash = {
            'command' => 'tail -n0 -F /var/opt/log/tpg/tpg.log',
            'name' => 'tpg.log',
            'connection' => {
                'host' => '127.0.0.0',
                'port' => 22,
                'user' => 'user',
                'password' => '123qwe'
            }
        }

        log = OlympusCommon::Logs::Log.new(hash)
        expect(log.instance_variable_get('@path')).to be_nil
        expect(log.instance_variable_get('@name')).to eq('tpg.log')
        expect(log.instance_variable_get('@command')).to eq('tail -n0 -F /var/opt/log/tpg/tpg.log')
        expect(log.instance_variable_get('@superUser')).to be_nil

        connection = log.instance_variable_get('@connection')
        expect(connection.instance_variable_get('@scheme')).to be_nil
        expect(connection.instance_variable_get('@user')).to eq('user')
        expect(connection.instance_variable_get('@password')).to eq('123qwe')
        expect(connection.instance_variable_get('@host')).to eq('127.0.0.0')
        expect(connection.instance_variable_get('@port')).to eq(22)
        expect(connection.instance_variable_get('@path')).to be_nil
    end
end