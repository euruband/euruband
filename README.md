# euruband

## Making music collaboratively using Sonic Pi

euruband makes it possible to code music together collaboratively
using sonic-pi together. Each user can enter a so-called "stage". 
Each stage has a performance and each user can contribute to 
that performance submitting Ruby code. The performance, which is
the concatenation of all participating users of a stage, 
will be send and played by Sonic Pi.

## Why should I do this?

Making music alone is fun, but doing music together possibly boosts
the fun factor. The far goal is the possibility of using euruband app
complete remotely, without the necessity of being in the same room. 

Currently this is not possible, but you can use the euruband app
e.g. via LAN. One person needs to run the rails application locally
*and* the classical sonic-pi IDE. The others can contribute then 
via euruband web application as clients. 

After the host has started the web app, clients can connect
via LAN, visit the web app in the browser an can add code snippets
to the running performance. Each client only can modify the code
that she added, but you can access and use the code of the others.

## Can I modify my band mates code?

No, it's like a real band: You can only modify "your instrument" (≡ your code) directly. But for 
example you can use a `cue` somebody started, so that your shared loops are "in sync".

## Ok, I'd like to run the app locally as a host. How to start euruband?

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

## Contributing

If you like the project and have an idea: Feel encouraged to contribute :)
