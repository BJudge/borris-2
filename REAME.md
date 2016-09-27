## This is the Read Me for Boris Bikes - Version 2


## User Stories
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working


| Objects     | Messages     |
| -----       | --------     |
| Person      |              |
| Bike        | working?     |
| DockingStation | release_bike |


As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.


Creating a Docking Station for a bike, and creating a bike for that station
station = DockingStation.new
bike = station.release_bike
