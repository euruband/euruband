# euruband

## Making music collaboratively using Sonic Pi

euruband works similar to a chat platform. We call 
each "chat room" a *stage* - since is is! On each stage, 
each user can add code contributions (which is simple text input)  
to the common conversation, the so-called  *performance*.

The performance of a stage is sent to Sonic Pi if a server 
is running locally.  

Currently this is only a scratch, but I like the idea of 
making music together - even remotely. Real remote sessions are not 
possible now. The current state of euruband allows you
to run it locally: Say, there are two persons in a LAN entering
a stage by visiting it in the browser.

## How to start

Run the following commands in seperate terminals: 

    $ rails s
    
    $ ./bin/cable
    
    $ redis-server

## Further notes

The basic architecture using `ActionCable` was adopted
from the [actioncable example app](https://github.com/rails/actioncable-examples).
