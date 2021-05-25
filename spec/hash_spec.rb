# frozen_string_literal: true

RSpec.describe Hash do
    it 'compact' do
        hash = {
            'user' => 'user',
            'password' => '123qwe',
            'host' => '',
            'uri' => nil
        }

        hash.compact
        expect(hash.key?('host')).to be
        expect(hash.key?('uri')).to be_falsey
    end

    it 'with_defaults' do
        default = {
            'user' => 'user',
            'password' => '123qwe'
        }

        hash = {
            'host' => '127.0.0.0',
            'port' => 22,
            'uri' => nil
        }

        new_hash = hash.with_defaults(default)
        expect(new_hash['host']).to eq('127.0.0.0')
        expect(new_hash['port']).to eq(22)
        expect(new_hash['user']).to eq('user')
        expect(new_hash['password']).to eq('123qwe')
        expect(new_hash.key?('uri')).to be_falsey
    end
end  