# Bongo
Rails engine for blogging using Trix and MongoDB.

## Installation
Add this line to your application's `Gemfile`:

```ruby
gem "bongo"
```

And then execute:
```bash
$ bundle
```

Add its assets to your `application.scss` and `application.js`:
```javascript
//= require "bongo/application"
```

Mount the engine in your `routes.rb`:
```ruby
mount Bongo::Engine, at: "/blog"
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
