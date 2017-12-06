LastTripInLivingRoom = os.time()
HumanInLivingRoom = 1
--log("Detected movement in living room, turn on living room light")

if luup.is_night() and isStopped(XBMC) then
    turnOnLight(LivingRoomLight)
end
