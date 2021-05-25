# frozen_string_literal: true

RSpec.describe String do
    it 'underscore' do
        expect('OlympusCommon::Connection::SshConnection'.underscore).to eq('olympus_common/connection/ssh_connection')
    end

    it 'true?' do
        expect('true'.true?).to be
    end
end  