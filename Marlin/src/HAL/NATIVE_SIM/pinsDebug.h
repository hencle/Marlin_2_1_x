/**
 * Marlin 3D Printer Firmware
 * Copyright (c) 2021 MarlinFirmware [https://github.com/MarlinFirmware/Marlin]
 *
 * Based on Sprinter and grbl.
 * Copyright (c) 2011 Camiel Gubbels / Erik van der Zalm
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 */

/**
 * Support routines for X86_64
 */
#pragma once

/**
 * Translation of routines & variables used by pinsDebug.h
 */

#define NUMBER_PINS_TOTAL NUM_DIGITAL_PINS
#define isAnalogPin(P) (digitalPinToAnalogIndex(P) >= 0 ? 1 : 0)
#define digitalRead_mod(p)  digitalRead(p)
#define getPinByIndex(p) pin_array[p].pin
#define printPinNameByIndex(x) do{ sprintf_P(buffer, PSTR("%-" STRINGIFY(MAX_NAME_LENGTH) "s"), pin_array[x].name); SERIAL_ECHO(buffer); }while(0)
#define printPinNumber(p) do{ sprintf_P(buffer, PSTR("%3d "), p); SERIAL_ECHO(buffer); }while(0)
#define printPinAnalog(p) do{ sprintf_P(buffer, PSTR(" (A%2d)  "), digitalPinToAnalogIndex(pin)); SERIAL_ECHO(buffer); }while(0)
#define MULTI_NAME_PAD 16 // space needed to be pretty if not first name assigned to a pin

// Active ADC function/mode/code values for PINSEL registers
int8_t ADC_pin_mode(pin_t pin);
int8_t get_pin_mode(const pin_t pin);
bool getValidPinMode(const pin_t pin);
bool getPinIsDigitalByIndex(const pin_t pin);
void printPinPort(const pin_t);
void printPinPWM(const pin_t);
bool pwm_status(const pin_t);
