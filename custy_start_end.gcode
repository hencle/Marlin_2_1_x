M140 S60 ; Start heating the bed to 60°C - This command initiates the heating of the bed to 60°C. It does not wait for the bed to reach the set temperature, allowing other operations to proceed concurrently.
M104 S200 ; Start heating the hotend to 200°C - This command starts heating the hotend (the nozzle) to 200°C, but it does not wait for the temperature to be reached before continuing.
M190 S60 ; Wait for the bed to reach 60°C - This command pauses the printer's operations until the bed reaches the specified temperature of 60°C.
M109 S200 ; Wait for the hotend to reach 200°C - This command pauses the printer until the hotend reaches the specified temperature of 200°C.

; Disable bed heating to avoid interference with the sensor
M140 S0 ; Temporarily turn off the bed heater - This command turns off the bed heater to prevent any potential interference with the bed leveling sensor, which could be affected by the magnetic fields or temperature fluctuations.

G28 ; Home all axes again (required by some setups before bed leveling) - Re-homes all the axes, ensuring that the printer starts from a consistent position before performing the bed leveling routine.
G29 ; Auto bed leveling - This command initiates the printer's automatic bed leveling procedure. The printer probes various points on the bed to compensate for any surface inconsistencies.

; Re-enable bed heating
M140 S60 ; Restore bed temperature to 60°C - This command re-enables the bed heater and sets it back to 60°C after the auto bed leveling is complete.

; Prusa-Style Single Purge Line
G1 Z2.0 F3000 ; Lift the nozzle to safe height
G1 X0 Y-3 Z0.3 F5000.0 ; Move to the front left corner, just off the print bed
G1 X60 Y-3 Z0.3 F1500.0 E9 ; Extrude a purge line along the front of the bed
G92 E0 ; Reset extruder position
G1 Z2.0 F3000 ; Lift the nozzle to safe height after purging



###########

; End G-code with bed heating to 63°C and hotend cooling to 160°C
G91 ; Relative positioning - Switches the printer to relative positioning mode, meaning all subsequent movements are relative to the current position rather than absolute coordinates.
G1 E-2 F2700 ; Retract a bit of filament to prevent oozing - Retracts 2mm of filament at a speed of 2700 mm/min to prevent filament from leaking out of the nozzle while the print finishes.
G1 Z10 F3000 ; Raise the Z axis a bit to avoid hitting the print - Raises the nozzle by 10mm to ensure that it doesn’t accidentally collide with the finished print when the print head moves.

G90 ; Absolute positioning - Switches the printer back to absolute positioning mode for precise movement based on the printer’s coordinate system.
G1 X0 Y200 F3000 ; Move the print head to the back-left corner (adjust as needed) - Moves the print head to the X0, Y200 position at a speed of 3000 mm/min. This typically moves the nozzle away from the print, usually to a "parking" position in the corner of the bed.

M104 S160 ; Set hotend temperature to 160°C - Reduces the hotend temperature to 160°C, which is a standby temperature often used to prevent the nozzle from oozing too much but still being ready if another action is needed.
M140 S63 ; Set bed temperature to 63°C - Sets the bed temperature to 63°C, often used as a cooling-down step to prevent warping of the printed object while it cools down gradually.

M190 S63 ; Wait for the bed to reach 63°C - Pauses the printer until the bed reaches the set temperature of 63°C, ensuring it cools down to the desired temperature before continuing.
M109 S160 ; Wait for the hotend to cool to 160°C - Pauses the printer until the hotend cools down to 160°C, ensuring safe cooling before any further actions.

; Once both temperatures are reached, shut down everything
M104 S0 ; Turn off hotend - Turns off the hotend heater entirely, ensuring that it cools down to room temperature.
M140 S0 ; Turn off bed heater - Turns off the bed heater entirely, allowing it to cool down to room temperature.
M107 ; Turn off the fan - Stops the part cooling fan that was used during printing.

M84 ; Disable all steppers - Turns off all stepper motors to release their holding torque, allowing the user to manually move the axes if needed.
