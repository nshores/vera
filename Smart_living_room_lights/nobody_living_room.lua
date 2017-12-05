3. Create scene name NobodyInLivingROom. This scene will be triggered by Living Room motion sensor not tripped event. In lua code of this scene, put following:

function CheckHumanInLivingRoomStatus()
    if HumanInLivingRoom == 1 or os.difftime(os.time(), LastTripInLivingRoom) < LivingRoomTimeout then
            -- log("Movement in kitchen room before delay LivingRoomTimeout seconds, do not turn off light")
        return true
    end

    -- log("No movement in kitchen room after delay LivingRoomTimeout seconds, turn off light")
    turnOffLight(LivingRoomLight)
end


LastTripInLivingRoom = os.time()
-- log("Detected no movement in kitchen room, check all sensors")


-- log("All sensors are not tripped. Turn off HumanInLivingRoom indicator and call delay LivingRoomTimeout seconds to turn off kitchen light")
if isNotTrip(LivingRoomMotionSensor) 
-- log("Checking to make sure XBMC is stopped")
    and isStopped(XBMC)
-- log("Checking to make sure Onkyo is off")
    and isOff(Onkyo) then 
-- log("Eveything off, people gone")
    HumanInLivingRoom = 0
    luup.call_delay ("CheckHumanInLivingRoomStatus", LivingRoomTimeout)
end