![Min.us](http://i7.minus.com/ibieCb1hOY5dUZ.png)

ErrandsOnTheWay is a trip planning app that allows you to route a trip, and add stops along the way, based on your errands. We utilize Geocoder, Google Maps API and Google Places API to analyze your trip and give you stopover options to choose from - optimized to get your tasks done in the least amount of time. Spend less time planning, and more time doing with ErrandsOnTheWay.

## Getting Started

*Note: This assumes you have Ruby 1.9.3 or later installed properly and have PostgreSQL running.*

First clone this repo
```bash
git clone https://github.com/LightningLord/errandsontheway.git
```

Install all the dependencies:
```bash
bundle install
```

Create the database:
```bash
rake db:create
rake db:migrate
```

Start the server:
```bash
rails s
```

To run the test suite:
```bash
rake db:test:prepare
rake spec
```

## Site on Heroku

![Imgur](http://i.imgur.com/xiKbeLR.png)

[errandsontheway.herokuapp.com](https://errandsontheway.herokuapp.com)

## Members:

* [Jason Lo](https://github.com/LightningLord) 
* [Ryan Wood](https://github.com/rbn1357)
* [Melanie Archer](https://github.com/mejarc)
* [Christine Dolendo](https://github.com/chrisdolendo)
