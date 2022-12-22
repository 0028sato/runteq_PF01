// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jquery from "jquery"
window.$ = window.jQuery = jquery
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap
import "../stylesheets/application"
import '../javascripts/preview'


Rails.start()
Turbolinks.start()
ActiveStorage.start()



