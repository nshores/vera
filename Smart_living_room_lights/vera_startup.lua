SS_SID = "urn:micasaverde-com:serviceId:SecuritySensor1"
SP_SID = "urn:upnp-org:serviceId:SwitchPower1"
ONKYO_SID = "urn:upnp-org:serviceId:SwitchPower1"
XBMC_SID = "urn:upnp-org:serviceId:XBMCState1"

HumanInLivingRoom = 0
LastTripInLivingRoom = os.time()
LivingRoomTimeout = 300

Onkyo = 8
XBMC = 9 
LivingRoomMotionSensor = 33
LivingRoomLight = 17

--Get status for light switch
function getStatus(devID)
    local devStatus = luup.variable_get(SP_SID, "Status", devID)
    return devStatus
end

function isOn(devID)
    local devStatus = luup.variable_get(SP_SID, "Status", devID)
    if (devStatus == "1") then
        return true
    else
        return false
    end
end

function isOff(devID)
    local devStatus = luup.variable_get(SP_SID, "Status", devID)
    if (devStatus == "0") then
        return true
    else
        return false
    end
end

--Get status for Onkyo
function getStatus(devID)
    local devStatus = luup.variable_get(ONKYO_SID, "Status", devID)
    return devStatus
end

function isOn(devID)
    local devStatus = luup.variable_get(ONKYO_SID, "Status", devID)
    if (devStatus == "1") then
        return true
    else
        return false
    end
end

function isOff(devID)
    local devStatus = luup.variable_get(ONKYO_SID, "Status", devID)
    if (devStatus == "0") then
        return true
    else
        return false
    end
end

--Get status for Onkyo
function getStatus(devID)
    local devStatus = luup.variable_get(XBMC_SID, "PlayerStatus", devID)
    return devStatus
end

function isPlaying(devID)
    local devStatus = luup.variable_get(XBMC_SID, "PlayerStatus", devID)
    if (devStatus == "Video_start") then
        return true
    else
        return false
    end
end

function isStopped(devID)
    local devStatus = luup.variable_get(XBMC_SID, "PlayerStatus", devID)
    if (devStatus == "Video_stop") then
        return true
    else
        return false
    end
end


--get status for motion sensor

function getTrip(devID)
    local devStatus = luup.variable_get(SS_SID, "Tripped", devID)
    return devStatus
end

function isTrip(devID)
    local devStatus = luup.variable_get(SS_SID, "Tripped", devID)
    if (devStatus == "1") then
        return true
    else
        return false
    end   
end

function isNotTrip(devID)
    local devStatus = luup.variable_get(SS_SID, "Tripped", devID)
    if (devStatus == "0") then
        return true
    else
        return false
    end   
end


--functions for controlling light
function turnOnLight(devID)
    local lightStatus = luup.variable_get(SP_SID, "Status", devID)
    if (lightStatus == "0") then
        luup.call_action (SP_SID, "SetTarget", {["newTargetValue"] = 1}, devID)
    end
end

function turnOffLight(devID)
    local lightStatus = luup.variable_get(SP_SID, "Status", devID)
    if (lightStatus == "1") then
        luup.call_action (SP_SID, "SetTarget", {["newTargetValue"] = 0}, devID)
    end
end
