Airport Challenge
=================

Integration
-----------
 Master:
![Travis CI](https://travis-ci.org/ALRW/airport_challenge.svg?branch=master)

About
-----
This is a simple program for an airport traffic controller to manage the takeoff and landing of plane at an airport that has limited capacity and can be subject to bad weather.

Languages
---------
This program was written in Ruby and uses the Rspec testing framework.
Install
-------

To install this program simply clone this repository from Github.

Basic Use
---------

Once the program has been cloned move into the program repository and run the following commands to use the program.

To generate a new Airport or plane use the commands:

`airport = Airport.new`

`plane = Plane.new`

To land or takeoff a plane from a specific airport use the commands:

`airport.land(plane)`

`airport.takeoff(_plane)`
