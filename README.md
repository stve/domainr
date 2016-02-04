# domainr

Ruby wrapper for the [Domainr API](http://domainr.build/).

## Installation

    gem install domainr

## Usage

Instantiate a new client:

    client = Domainr::Client.new(mashape_key: 'abcdefghijklmnopqrstuvwxyz')

If you are using Domainr's high volume API endpoints, you can pass the client_id and endpoint instead:

    client = Domainr::Client.new(client_id: '123456789', endpoint: 'https://api.domainr.com')

Once configured, you can use the `Domainr::Client` to retrieve information about a domain:

    client.status('google.com')

You can also search Domainr based on a search term:

    client.search('twitter')

## Contributing

Pull requests welcome: fork, make a topic branch, commit (squash when possible) *with tests* and I'll happily consider.

## Copyright

Copyright (c) 2016 Steve Agalloco. See [LICENSE](LICENSE.md) for detail
