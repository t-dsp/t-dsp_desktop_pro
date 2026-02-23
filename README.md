# T-DSP Desktop Pro

**Part of the [T-DSP](https://t-dsp.com) open modular audio platform.**

A desktop audio backplane (120mm x 100mm) that serves as the central hub for the T-DSP modular audio ecosystem. Hosts a Teensy 4.1, ESP32, and T-DSP TAC5212 pro audio codec module on an 8-layer PCB designed for studio-quality signal integrity.

[![T-DSP Desktop Pro - Top Isometric](https://t-dsp.github.io/t-dsp_desktop_pro/renders/t-dsp_desktop_pro-3D_blender_th_top_iso.png)](https://t-dsp.github.io/t-dsp_desktop_pro/gallery.html)

| | |
|:---:|:---:|
| [![Top](https://t-dsp.github.io/t-dsp_desktop_pro/renders/t-dsp_desktop_pro-3D_blender_th_top.png)](https://t-dsp.github.io/t-dsp_desktop_pro/gallery.html) | [![Bottom](https://t-dsp.github.io/t-dsp_desktop_pro/renders/t-dsp_desktop_pro-3D_blender_th_bottom.png)](https://t-dsp.github.io/t-dsp_desktop_pro/gallery.html) |
| [![Front](https://t-dsp.github.io/t-dsp_desktop_pro/renders/t-dsp_desktop_pro-3D_blender_th_front.png)](https://t-dsp.github.io/t-dsp_desktop_pro/gallery.html) | [![Rear](https://t-dsp.github.io/t-dsp_desktop_pro/renders/t-dsp_desktop_pro-3D_blender_th_rear.png)](https://t-dsp.github.io/t-dsp_desktop_pro/gallery.html) |

**[View 3D Render Gallery](https://t-dsp.github.io/t-dsp_desktop_pro/gallery.html)** -- interactive slideshow of all board views

## About T-DSP

T-DSP is an open modular audio platform designed for musicians, engineers, and developers who want powerful digital signal processing in a flexible, hackable format. Built around the [Teensy](https://www.pjrc.com/teensy/) microcontroller and the [Teensy Audio Library](https://www.pjrc.com/teensy/td_libs_Audio.html), T-DSP combines studio-quality audio with a growing library of open-source modules for mixing, synthesis, effects, and more.

Whether you're building a custom digital mixer, crafting a unique instrument, or prototyping audio products, T-DSP gives you the tools to bring your ideas to life.

Join the community, contribute to the library, or grab a module and start patching. Learn more at [t-dsp.com](https://t-dsp.com).

## Overview

The Desktop Pro is a **backplane PCB** that hosts a Teensy 4.1, ESP32, and T-DSP codec module alongside supporting ICs to create a complete audio development platform. It provides all the connectors, processing, networking, and user interface needed to build desktop audio devices.

## Processing

- **Teensy 4.1** -- ARM Cortex-M7 running the Teensy Audio Library for real-time audio processing (mixing, effects, synthesis, routing). Also receives USB Audio.
- **ESP32** -- UI controller, WiFi/Bluetooth connectivity. Runs the display, buttons, and encoder, and sends commands to the Teensy over serial.
- **T-DSP TAC5212 Module** -- Professional stereo audio codec (ADC + DAC) with mic preamp, line, and instrument inputs

## On-Board ICs

| Ref | Part | Function |
|-----|------|----------|
| U1 | Teensy 4.1 | Audio DSP (ARM Cortex-M7) |
| U2 | ESP32-DevKitC | UI controller, WiFi/Bluetooth |
| U3 | TPS2116DRL | Power multiplexer (dual input selection) |
| U4 | H11L1SM | Optoisolator (MIDI input) |
| U5-U8 | SN74LVC2G125DCTR | Dual bus buffers (4x) |
| U9 | 74HCT2G17GW | Dual Schmitt trigger buffer |
| U10 | TPD4E02B04DQA | USB ESD protection (4-channel) |
| IC1 | 74HCT2G125DC | Logic level shifter |
| D5 | TPD1E10B06DPYT | VBUS ESD protection |
| Q1, Q2 | DMG2307L-7 | P-FET reverse polarity protection |

## Connectivity

### Audio I/O
- **RCA outputs** -- Stereo analog audio output
- **RCA inputs** -- Stereo analog audio input
- **Headphone output** -- 1/4" (6.35mm) or 3.5mm headphone jack
- **S/PDIF** -- Digital audio input and output

### USB
- **USB-C DEVICE** -- Power and USB Audio to Teensy with ESD protection (TPD4E02B04 + TPD1E10B06)
- **USB-A HOST** -- USB host connector

### MIDI
- **MIDI input** -- 3.5mm TRS with optical isolation (H11L1)
- **MIDI GPIO** -- Configurable for MIDI in, out, or thru

### Power
- **Dual power input** -- USB-C or external supply via JST-XH header, with TPS2116 power multiplexer for automatic switchover
- **Reverse polarity protection** -- P-channel MOSFET (DMG2307L-7) on both 5V and 12V inputs
- **Power indicators** -- LED indicators for 5V and 12V rails

### Storage
- **SD card** -- Accessible via Teensy 4.1 built-in SD slot

## Expansion

- **2x TDM expansion headers** (2x10 pin, 2.54mm) -- Connect T-DSP audio modules
  - TDM digital audio bus (BCLK, LRCK, DATA_IN, DATA_OUT, MCLK)
  - I2C control bus (SDA, SCL)
  - Power rails (3.3V, 5V, 12V, GND)
  - Control pins (Held-high, Held-low)
- Modules can be soldered directly or socketed with pin headers
- Multiple modules can be chained on the same TDM bus

## User Interface

The backplane exposes interface-ready GPIO headers for flexible UI connectivity, supporting popular interface options compatible with the ESP32.

- **GPIO header** -- Active-low buttons, rotary encoder, and display connections for tactile UI
- **OLED display header** (128x64, SSD1306) -- Status and menu-driven UI
- **3.2" TFT touchscreen header** (ILI9341) -- Touchscreen UI
- **SK6812 addressable LED header** -- ESP32 and Teensy status indication, plus LED strip control

## Board Design

- **8-layer PCB** with dedicated ground and power planes for low-noise analog performance
- **120mm x 100mm** board dimensions
- LDO voltage regulation for clean analog power
- Buffered digital outputs for reliable module distribution
- Separate analog and digital ground domains

## Project Files

| Directory | Contents |
|-----------|----------|
| `/3d_models/` | 3D models for PCB components |
| `/documentation/` | [Schematic PDF](documentation/t-dsp-desktop-pro-schematic.pdf), board images, and reference docs |
| `/lib_fp/` | Custom KiCad footprint libraries |
| `/lib_sch/` | Custom KiCad schematic symbol libraries |
| `/manufacturing/` | CI-generated manufacturing outputs (gerbers, BOM, pick & place, PDFs) |
| `/panel/` | Panelized board layouts for production |
| `/pages/` | [3D Render Gallery](https://t-dsp.github.io/t-dsp_desktop_pro/gallery.html), [Interactive BOM](https://t-dsp.github.io/t-dsp_desktop_pro/ibom.html) |

View the design files directly in your browser with KiCanvas: [Schematic](https://kicanvas.org/?github=https://github.com/t-dsp/t-dsp_desktop_pro/blob/main/t-dsp_desktop_pro.kicad_sch) | [PCB](https://kicanvas.org/?github=https://github.com/t-dsp/t-dsp_desktop_pro/blob/main/t-dsp_desktop_pro.kicad_pcb)

## Status

This board is under active development. The current revision includes USB-C ESD protection, reverse polarity protection, and boot pin corrections from the pre-production review.

If you build one, we'd love to hear how it goes -- please open an issue or reach out with your findings.

## Contact

For consulting, custom backplane design, or commercial licensing inquiries, reach out via [LinkedIn](https://linkedin.com/in/jayshoe).

## License

This project is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

You are free to share and adapt this work for non-commercial purposes, as long as you give appropriate credit and distribute any derivatives under the same license.
