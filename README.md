# Connected

Connected is a React Native-Rails API project that helps you find people in your city with the same interests as you.

### Project Description

This was our final group project for Dev Bootcamp. We decided to choose a simple app idea, so we could focus on learning React Native and figuring out how to implement it with a Rails API.

Click here for the [React Native Repo](https://github.com/SeanWitt/ReactNative_Connected)
### Installation

Note: This repo only contains the Rails backend.

To install the app to your local computer run

    git clone https://github.com/tjoye20/Connected.git

##### Install the necessary gems

    bundle install

##### Create and migrate your database

    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed

##### To run the RSpec tests
Note: some of the tests may fail now since last minute changes were made in order to make the backend work with React Native, and we didn't have time to update the tests to account for React Native.

    bundle exec rspec spec

##### To launch the app

    rails s

### How To Use
Launch both this repo, for the Rails API and, the React Native Repo, then simply sign in and create your profile. After that, you'll see a list of interests/categories that you can click on and see the people in the same zip code as you with that same interest. Clicking on their name name takes you to their profile page, and the option to start a chat with them.

Note: The users in the app right now are from seed data. Also, this app still needs further development.
