LastTripInLivingRoom = os.time()
HumanInLivingRoom = 1
--log("Detected movement in living room, turn on living light")
if luup.is_night() == true then
    turnOnLight(LivingRoomLight)
    else
end