// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("admin-lte");
import '@fortawesome/fontawesome-free/js/all'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import jquery from "jquery"
window.$ = window.jQuery = jquery
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap
import "../stylesheets/application.scss"
import '../javascripts/preview'
import "../stylesheets/post_index.scss"
import "../stylesheets/post_show.scss"
import "../stylesheets/post_form.scss"
import "../stylesheets/header.scss"
import "../stylesheets/footer.scss"
import "../stylesheets/login.scss"
import "../stylesheets/signup.scss"
import "../stylesheets/profile.scss"
import "../stylesheets/password_reset.scss"
import "../stylesheets/like.scss"
import "../stylesheets/search.scss"


Rails.start()
Turbolinks.start()
ActiveStorage.start()



