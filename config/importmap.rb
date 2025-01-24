# Pin npm packages by running ./bin/importmap

# https://stackoverflow.com/questions/69691718/how-to-use-jqueryui-in-a-rails-6-or-rails-7-alpha-engine/72150447#72150447
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"
pin "jquery-ui-dist", to: "https://ga.jspm.io/npm:jquery-ui-dist@1.13.1/jquery-ui.js"
pin "bbox_annotator" # Requires jquery and jqueryui

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
