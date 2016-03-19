# euruband

## Making music collaboratively using Sonic Pi

euruband makes it possible to code music together collaboratively
using sonic-pi together via LAN. One person needs to run the
rails application *and* the classical sonic-pi IDE as "host" - the others
can contribute then via euruband web application as clients.

After the host has started the web app, clients can connect
via LAN, visit the web app in the browser an can add code snippets
to the running performance. Each client only can modify the code
that she added, but you can access and use the code of the others.

For example you can use a `cue` somebody started, so that your shared 
loops are "in sync".

## Ok, I am the host. How to start euruband as the host?

Clone this repo and run the following commands concurrently in
seperate terminals:

    $ rails s
    
    $ ./bin/cable
    
    $ redis-server

In addition to that you need to have a Sonic Pi server running in order to hear 
something. E.g. simply open the desktop application besides your browser. 

## Further notes

The basic architecture using `ActionCable` was simply adopted
from the [actioncable example app](https://github.com/rails/actioncable-examples).
