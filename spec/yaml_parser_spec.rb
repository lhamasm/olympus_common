# frozen_string_literal: true

RSpec.describe OlympusCommon::YamlParser do
    it 'load' do
        absolute_path = File.expand_path('../yaml_files/yaml_file_1.yml', __FILE__)
        yaml = OlympusCommon::YamlParser.load(absolute_path)
        
        credentials = yaml['credentials']['admin']
        expect(credentials['user']).to eq('user')
        expect(credentials['password']).to eq('123qwe')

        access = yaml['localhost']['ssh']
        expect(access['host']).to eq('127.0.0.0')
        expect(access['port']).to eq(22)
        expect(access['user']).to eq('user')
        expect(access['password']).to eq('123qwe')
    end
end  