A series of LUA scripts to create a lighting control system based on occupancy, other inputs (
Recievers, TV's, HTPC's) and a motion sensor. 

1. Put following in lua start up - vera_startup.lua
2. Create scene name SomebodyInLivingRoom. This scene will be triggered by living room motion sensor. Insert the code from somebody_in_living_room.lua as a LUA trigger.
3. Create scene name NobodyInLivingRoom. This scene will be triggered by Living Room motion sensor not tripped event. In lua code of this scene, paste in nobody_living_room.lua

This script requires the use of XBMCState, and the Onkyo receiver plugin. 

Code based on examples found here --

http://forum.micasaverde.com/index.php?topic=50231.0
