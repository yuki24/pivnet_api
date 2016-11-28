# Ruby Client for The Pivotal One Network API v2

This gem is a ruby http client for the Pivotal Network v2 API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pivnet_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pivnet_api

## Usage

To set up a client:

```ruby
@client = PivnetApi::V2.build(API_TOKEN, domain: ENDPOINT)
```

 * The client methods use restful syntax
 * Client methods return Net::HTTP objects

Using the client:

```ruby
@client.get_product('pivotal-cf')        # => calls GET /api/v2/products/pivotal-cf
@client.get_product_files('ops-manager') # => calls GET /api/v2/products/ops-manager/product_files

release = {
  release: {
    version: "1.0.0",
    release_notes_url: "http://example.com/release",
    description: "Release description",
    release_date: "2013-12-11",
    release_type: "Security Release",
    availability: "Admins Only",
    eula: {
      slug: "pivotal_software_eula"
    },
    oss_compliant: "confirm",
    end_of_support_date: "2015-5-10",
    end_of_guidance_date: "2015-6-30",
    end_of_availability_date: "2015-7-4",
    eccn: "5D002",
    license_exception: "ENC Unrestricted",
    controlled: true
  }
}

@client.post_release('pivotal-cf', release) # => calls POST /api/v2/products/pivotal-cf/releases

response = @client.get_product('pivotal-cf')

response.body # => returns body as a string object
response.json # => returns body as a Ruby array or hash
```

For all the client methods available, please have a look at [`pivnet_v2_spec.rb`](https://github.com/yuki24/pivnet_api/blob/master/pivnet_v2_spec.rb) or [`lib/pivnet_api/v2/client.rb`](https://github.com/yuki24/pivnet_api/blob/master/lib/pivnet_api/v2/client.rb).

## Development

0. Refer to the official Pivotal Network docs at https://network.pivotal.io/docs/api
1. Edit `pivnet_v2_spec.rb` with relevant endpoints
2. Run `ruby -roven pivnet_v2_spec.rb rubocop -a`
3. Manually test endpoints if necessary
4. Make a commit and pull request

Run `rake test` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yuki24/pivnet_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

