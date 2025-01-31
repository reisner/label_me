# Label-Me

Small Rails app for labelling images. Go to the labelling link for each image and click+drag to label image.

## Image Labels

To use your custom list of image labels, add them (one per line) to `config/labels.txt`.

## Setup

* `bundle install`
* `rails db:create`
* `rails db:migrate`
* Verify tests pass: `rspec`
* Run the dev server: `bin/dev`
* To use your own labels, add them (one per line) to `config/labels.txt`
