NoPassword is a simple authentication and session engine that removes
the need for passwords. Instead, it uses tokens sent to an email
address, similar to most forgot password functionality. These tokens
created long-lived sessions that can be tracked and revoked easily.

[Ben Brown](http://ilovebenbrown.com/) wrote a great article about [password-less logins](http://notes.xoxco.com/post/27999787765/is-it-time-for-password-less-login), the same concept implemented by NoPassword.

NoPassword is structured as a Rails Engine, which you can mount in your
routes file:

    mount Nopassword::Engine, :at => "/nopassword"

You'll need to install the migrations:

    rake nopassword:install:migrations
    rake db:migrate

You can set up a signin form with the `send_login_email` route and a
request parameter named `email`.

You'll need to get Rails' [ActionMailer](http://guides.rubyonrails.org/action_mailer_basics.html) configured correctly for sending NoPassword emails.

Finally, you need to download the latest GeoIP database:

    cd db
    wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz && gzip -d GeoLiteCity.dat.gz

NoPassword uses the MIT-LICENSE.
