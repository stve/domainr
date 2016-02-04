require 'spec_helper'

RSpec.describe Domainr::Client do
  let(:mashape_key) { '123456789' }
  let(:client) { Domainr::Client.new(mashape_key: mashape_key) }

  context 'initialization' do
    it 'instantiates with a default endpoint' do
      expect(client.endpoint).to eq(Domainr::Client::DEFAULT_ENDPOINT)
    end
  end

  describe '#search' do
    before do
      stub_get('/v2/search')
        .with(query: {'query' => 'acme cafe', 'mashape-key' => mashape_key})
        .to_return(body: fixture('search.json'), headers: {content_type: 'application/json; charset=utf-8'})
    end

    it 'gets the correct resource' do
      client.search('acme cafe')
      expect(a_get('/v2/search').with(query: {'query' => 'acme cafe', 'mashape-key' => mashape_key}))
        .to have_been_made
    end

    it 'returns an array of domains' do
      results = client.search('acme cafe')

      expect(results).to be_an Array
      expect(results.size).to eq(8)
      expect(results.first).to be_a Domainr::Domain
    end
  end

  describe '#status' do
    before do
      stub_get('/v2/status')
        .with(query: {'domain' => 'acme.cafe', 'mashape-key' => mashape_key})
        .to_return(body: fixture('status.json'), headers: {content_type: 'application/json; charset=utf-8'})
    end

    it 'gets the correct resource' do
      client.status('acme.cafe')
      expect(a_get('/v2/status').with(query: {'domain' => 'acme.cafe', 'mashape-key' => mashape_key}))
        .to have_been_made
    end

    it 'returns an array of domains' do
      results = client.status('acme.cafe')

      expect(results).to be_an Array
      expect(results.size).to eq(2)
      expect(results.first).to be_a Domainr::Domain
    end
  end

  context 'high volume use' do
    let(:endpoint) { 'https://api.domainr.com' }
    let(:client_id) { 'abcdefghijklmnopqrstuvwxyz' }
    let(:client) { Domainr::Client.new(client_id: client_id, endpoint: endpoint) }

    before do
      stub_get('/v2/search', endpoint)
        .with(query: {query: 'beforeitwasround', client_id: client_id})
        .to_return(status: 200, body: fixture('search.json'), headers: {})
    end

    it 'overrides the default endpoint' do
      expect(client.endpoint).to eq(endpoint)
    end

    it 'uses the client_id when making API requests' do
      client.search('beforeitwasround')
      expect(a_get('/v2/search', endpoint).with(query: {query: 'beforeitwasround', client_id: client_id}))
        .to have_been_made
    end
  end
end
