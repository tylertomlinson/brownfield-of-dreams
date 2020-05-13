

<p align="center">
 <img src= "https://i.imgur.com/YN2Sc8S.png">
</p>

<p align="center">
 <img width="1000" height="400" src="https://i.imgur.com/hIbaE2y.jpg">
</p>



## About

This is a Ruby on Rails application used to organize YouTube content used for online learning. Each tutorial is a playlist of video segments. Within the application an admin is able to create tags for each tutorial in the database. A visitor or registered user can then filter tutorials based on these tags.

A visitor is able to see all of the content on the application but in order to bookmark a segment they will need to register. Once registered a user can bookmark any of the segments in a tutorial page.

## Getting Started 

### Prerequisites
```ruby
$ brew install ruby -2.5.3
$ gem install rails -5.2.0
``` 

### Installing

#### Clone repository:
```ruby
$ git clone git@github.com:tylertomlinson/brownfield-of-dreams.git
```
#### Navigate into directory:
```ruby
$ cd brownfield-of-dreams
```
#### Install gems:
```ruby
$ bundle install
```

#### Install node packages for stimulus
```ruby
$ brew install node
$ brew install yarn
$ yarn
```

#### Configure databases:
```ruby
$ rake db:{create,migrate,seed}
```
#### Fire up local server: (http://localhost:3000)
```ruby
$ rails s
```

### Youtube API

This project makes use of the Youtube API.

First, obtain an API key by following steps 1 - 3 in [this guide](https://developers.google.com/youtube/v3/getting-started) for the "Before you Start" section. When creating new credentials, make sure you choose the "API Key" option. Make sure that you follow the step to enable the Youtube Data API. Your API key will not work without that step.

Once you have obtained an API key and enabled the API:

1. Run `bundle exec figaro install`
2. This will create the file `config/application.yml`. Open that file.
1. Append the following to that file: `YOUTUBE_API_KEY: <your api key>`, `replacing <your api key>` with the api key you just obtained.

#### Run test suite:
```ruby
$ bundle exec rspec
```

If set up correctly, and assuming you have internet access and the Youtube API is functioning correctly, you should have all passing tests.

## Technologies
* [Stimulus](https://github.com/stimulusjs/stimulus)
* [will_paginate](https://github.com/mislav/will_paginate)
* [acts-as-taggable-on](https://github.com/mbleigh/acts-as-taggable-on)
* [webpacker](https://github.com/rails/webpacker)
* [selenium-webdriver](https://www.seleniumhq.org/docs/03_webdriver.jsp)
* [chromedriver-helper](http://chromedriver.chromium.org/)





