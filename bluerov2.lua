-- ****************************************************
--
-- LUA File to emulate a gamepad with a keyboard and
-- control BlueROV ArduSub engine with QGroundControl
-- 
-- ****************************************************


--Physical devices to use (type lsusb in terminal to list your connected devices)
devices = 
   {

      kbd0 = "/dev/input/event3"  -- keyboard device (try to find a suitable device by listing input devices by typing 'ls /dev/input/by-id/' )

   }

--Virtual devices to create, current limit is maximum 53 (0 to 52) buttons and 19 (0 to 18) axes. Note that not every button or axis is fully tested to work.
--Creating more than one virtual devices is possible, making room for more buttons and axes.
v_devices = 
   {
      v0 = 
	 {
	    buttons = 15, -- Sony PS3 Controller Gamepad
	    axes = 4
	 }
   }

-- Send method for keyboard. Key is given, i.e. KEY_G (check reference document for more supported key-codes), and state is given, i.e. 0 for release or 1 for press.
-- send_keyboard_event(key, state)

-- Send methods for virtual devices. Index of virtual device is given, i.e. 0 for v0, 1 for v1 and so on. Button/axis is given, i.e. 0 for button 0, 1 for button 1 and so on.
-- send_button_event(vjoy, button, state)
-- send_axis_event(vjoy, axis, pos)			//pos is the axis position (-32767 >= pos <= 32767)

-- Get methods for physical devices. Arguments applies in the same way as for above methods.
-- get_button_status(joy, button) 	//Returns 0 or 1 if button is pressed or not.
-- get_axis_status(joy, axis)		//Returns the axis position value

-- Get methods for virtual devices, applies in the same way as for physical devices.
-- get_vjoy_button_status(vjoy, button)
-- get_vjoy_axis_status(vjoy, axis)


function kbd0_pressed(value)

   -- *** Buttons ***
   if value == KEY_TAB then
      send_button_event(0, 1, 1) -- Stabilize
   end

   if value == KEY_SPACE then
      send_button_event(0, 2, 1) -- Position hold
   end

   if value == KEY_BACKSPACE then
      send_button_event(0, 3, 1) -- Depth hold
   end

   if value == KEY_ESC then
      send_button_event(0, 4, 1) -- Disarmed
   end

   if value == KEY_LEFTSHIFT then
      send_button_event(0, 5, 1) -- Shift
   end

   if value == KEY_ENTER then
      send_button_event(0, 6, 1) -- Armed
   end

   if value == KEY_KPENTER then
      send_button_event(0, 6, 1) -- Armed
   end

   if value == KEY_HOME then
      send_button_event(0, 7, 1) -- Mount center
   end

   if value == KEY_KPASTERISK then
      send_button_event(0, 8, 1) -- Input hold set
   end

   if value == KEY_PAGEDOWN then
      send_button_event(0, 9, 1) -- Mount down
   end

   if value == KEY_PAGEUP then
      send_button_event(0, 10, 1) -- Mount up
   end

   if value == KEY_KPPLUS then
      send_button_event(0, 11, 1) -- Gain increase
   end

   if value == KEY_KPMINUS then
      send_button_event(0, 12, 1) -- Gain decrease
   end

   if value == KEY_F5 then
      send_button_event(0, 13, 1) -- Lights dimmer
   end

   if value == KEY_F6 then
      send_button_event(0, 14, 1) -- Lights brighter
   end

   -- *** Left stick ***

   if value == KEY_D then
      send_axis_event(0, 0, 32767)
   end

   if value == KEY_A then
      send_axis_event(0, 0, -32767)
   end

   if value == KEY_S then
      send_axis_event(0, 1, 32767)
   end

   if value == KEY_W then
      send_axis_event(0, 1, -32767)
   end

   -- *** Right stick ***

   if value == KEY_6 then
      send_axis_event(0, 2, 32767)
   end

   if value == KEY_4 then
      send_axis_event(0, 2, -32767)
   end

   if value == KEY_2 then
      send_axis_event(0, 3, 32767)
   end

   if value == KEY_5 then
      send_axis_event(0, 3, 32767)
   end

   if value == KEY_8 then
      send_axis_event(0, 3, -32767)
   end

   -- *** Right stick alternative ***

   if value == KEY_KP6 then
      send_axis_event(0, 2, 32767)
   end

   if value == KEY_KP4 then
      send_axis_event(0, 2, -32767)
   end

   if value == KEY_KP2 then
      send_axis_event(0, 3, 32767)
   end

   if value == KEY_KP5 then
      send_axis_event(0, 3, 32767)
   end

   if value == KEY_KP8 then
      send_axis_event(0, 3, -32767)
   end

end

function kbd0_released(value)

   -- *** Buttons ***
   if value == KEY_TAB then
      send_button_event(0, 1, 0) -- Stabilize
   end

   if value == KEY_SPACE then
      send_button_event(0, 2, 0) -- Position hold
   end

   if value == KEY_BACKSPACE then
      send_button_event(0, 3, 0) -- Depth hold
   end

   if value == KEY_ESC then
      send_button_event(0, 4, 0) -- Disarmed
   end

   if value == KEY_LEFTSHIFT then
      send_button_event(0, 5, 0) -- Shift
   end

   if value == KEY_ENTER then
      send_button_event(0, 6, 0) -- Armed
   end

   if value == KEY_KPENTER then
      send_button_event(0, 6, 0) -- Armed
   end

   if value == KEY_HOME then
      send_button_event(0, 7, 0) -- Mount center
   end

   if value == KEY_KPASTERISK then
      send_button_event(0, 8, 0) -- Input hold set
   end

   if value == KEY_PAGEDOWN then
      send_button_event(0, 9, 0) -- Mount down
   end

   if value == KEY_PAGEUP then
      send_button_event(0, 10, 0) -- Mount up
   end

   if value == KEY_KPPLUS then
      send_button_event(0, 11, 0) -- Gain increase
   end

   if value == KEY_KPMINUS then
      send_button_event(0, 12, 0) -- Gain decrease
   end

   if value == KEY_F5 then
      send_button_event(0, 13, 0) -- Lights dimmer
   end

   if value == KEY_F6 then
      send_button_event(0, 14, 0) -- Lights brighter
   end

   -- *** Left stick ***

   if value == KEY_D then
      send_axis_event(0, 0, 0)
   end

   if value == KEY_A then
      send_axis_event(0, 0, 0)
   end

   if value == KEY_S then
      send_axis_event(0, 1, 0)
   end

   if value == KEY_W then
      send_axis_event(0, 1, 0)
   end

   -- *** Right stick ***
	
   if value == KEY_6 then
      send_axis_event(0, 2, 0)
   end

   if value == KEY_4 then
      send_axis_event(0, 2, 0)
   end

   if value == KEY_2 then
      send_axis_event(0, 3, 0)
   end

   if value == KEY_5 then
      send_axis_event(0, 3, 0)
   end

   if value == KEY_8 then
      send_axis_event(0, 3, 0)
   end

   -- *** Right stick alternative ***
	
   if value == KEY_KP6 then
      send_axis_event(0, 2, 0)
   end

   if value == KEY_KP4 then
      send_axis_event(0, 2, 0)
   end

   if value == KEY_KP2 then
      send_axis_event(0, 3, 0)
   end

   if value == KEY_KP5 then
      send_axis_event(0, 3, 0)
   end

   if value == KEY_KP8 then
      send_axis_event(0, 3, 0)
   end
end



