require 'spec_helper'

RSpec.describe Domainr::Error do
  let(:mashape_key) { '123456789' }
  let(:client) { Domainr::Client.new(mashape_key: mashape_key) }

  describe '#code' do
    it 'returns the error code' do
      error = Domainr::Error.new('No results found.', 404)
      expect(error.code).to eq(404)
    end
  end

  describe '#message' do
    it 'returns the error message' do
      error = Domainr::Error.new('No results found.')
      expect(error.message).to eq('No results found.')
    end
  end

  context 'when error in body' do
    let(:response_body) { fixture('error.json') }
    before do
      stub_get('/v2/status')
        .with(query: {'domain' => 'beforeitwasround.com', 'mashape-key' => mashape_key})
        .to_return(status: 200, body: response_body, headers: {content_type: 'application/json; charset=utf-8'})
    end
    it 'raises a Domainr::Error' do
      expect { client.status('beforeitwasround.com') }.to raise_error(Domainr::Error)
    end
  end

  context 'when error http response' do
    let(:response_body) { fixture('error.json') }
    before do
      stub_get('/v2/status')
        .with(query: {'domain' => 'beforeitwasround.com', 'mashape-key' => mashape_key})
        .to_return(status: 404, body: response_body, headers: {content_type: 'application/json; charset=utf-8'})
    end
    it 'raises a Domainr::Error' do
      expect { client.status('beforeitwasround.com') }.to raise_error(Domainr::Error)
    end
  end

  describe '.from_response' do
    it 'returns a Domainr::Error' do
      error = Domainr::Error.from_response('status' => 404, 'message' => 'No results found.')
      expect(error).to be_an Domainr::Error
      expect(error.message).to eq('No results found.')
    end
  end
end
