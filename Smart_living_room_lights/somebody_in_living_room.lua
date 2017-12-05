2. Create scene name SomebodyInKitchen. This scene will be triggered by living room motion sensor

LastTripInLivingRoom = os.time()
HumanInLivingRoom = 1
--log("Detected movement in kitchen room, turn on kitchen light")
turnOnLight(LivingRoomLight)

