<div align="center">

# 📡 LABVIEW Equalizer ASK Modulation Project
### Design and Implementation of an Equalizer for Amplitude-Shift Keying (ASK) Modulation using LabVIEW and USRP-2900

<p>
  <img alt="Platform" src="https://img.shields.io/badge/platform-LabVIEW-blue">
  <img alt="Hardware" src="https://img.shields.io/badge/hardware-USRP--2900%20%7C%20RF%20Coax-success">
  <img alt="Topic" src="https://img.shields.io/badge/topic-ASK%20Modulation-orange">
  <img alt="DSP" src="https://img.shields.io/badge/DSP-Equalizer%20%7C%20ADC%20%7C%20DAC-informational">
</p>

<p><b>ASK-based audio transmission system with equalization, ADC/DAC processing, and LabVIEW–USRP implementation</b></p>

</div>

---

## Overview

This project focuses on the **design and implementation of an equalizer for Amplitude-Shift Keying (ASK) modulation** using **NI LabVIEW** and **USRP-2900** hardware.

The system is designed to transmit audio between a transmitter and receiver while using:

- **ASK modulation and demodulation**
- **DSP-based equalization**
- **ADC and DAC conversion**
- **LabVIEW-based system design**
- **USRP-2900 RF communication hardware**

The project demonstrates how digital communication, modulation theory, and practical DSP techniques can be combined into a complete transmission chain for audio signals.

---

## Project Objective

The goal of the project is to **transfer sound between transmitter and receiver** using ASK modulation while improving signal quality through DSP and equalization techniques.

The system aims to:

- transmit audio through a communication channel
- represent the signal digitally via ADC
- modulate and demodulate the data using ASK
- suppress distortion and periodic noise
- recover the signal through DAC
- improve output quality using a multi-channel equalizer

---

## Why this project matters

ASK is one of the classical digital modulation methods, but real communication channels introduce:

- noise
- distortion
- fading-related degradation
- imperfect recovery conditions

This project addresses those issues through a practical LabVIEW implementation that combines:

- modulation
- demodulation
- equalization
- digital filtering
- signal recovery

It is a strong example of a hands-on communication systems project bridging theory and implementation.

---

## Repository Structure

```text
.
├── EE_3001_Term_Project.pdf   # Full project report
├── *.vi                       # LabVIEW transmitter, receiver, and DSP blocks
├── adc.m                      # MATLAB-based ADC processing script
├── dac.m                      # MATLAB-based DAC processing script
└── related project assets     # Supporting files and LabVIEW resources
```

---

## System Architecture

The report describes the full signal path as:

**Song + periodic noise → ASK transmitter → channel → ASK receiver → equalizer → output sound**

This architecture includes both communication and DSP enhancement stages.

### Main system stages

1. **Input audio**
2. **Noise addition**
3. **ADC processing**
4. **ASK modulation (TX)**
5. **Transmission through channel**
6. **ASK demodulation (RX)**
7. **Equalization**
8. **DAC processing**
9. **Audio playback**

---

## Hardware and Software Stack

### Software
- **NI LabVIEW**
- **MATLAB** for ADC and DAC helper processing

### Hardware
- **NI USRP-2900**
- **RF coaxial cables with SMA connectors**
- communication system test setup for TX/RX stages

---

## Core Technical Components

## 1) ASK Transmitter

The transmitter side converts the incoming signal into a digital representation and prepares it for ASK modulation.

The report explains that the TX side includes:

- message input
- added periodic noise
- ADC conversion
- symbol mapping
- pulse shaping
- upsampling
- carrier modulation

The ASK symbol mapping is described using two amplitude levels for binary `0` and `1`, followed by pulse shaping and carrier multiplication.

---

## 2) ADC Processing

The ADC stage is implemented using an external MATLAB script (`adc.m`) called from LabVIEW.

According to the report, this stage includes:

- combining the reference signal with a chosen noise signal
- quantization using **16 bits**
- binary conversion
- reshaping the output into a bitstream

The report notes that **65536 quantization levels** are created between `-1` and `1`, corresponding to 16-bit conversion.

---

## 3) Synchronization

A practical synchronization issue was observed between TX and RX.

The report explains that:

- data transfer initially had a large delay
- RX behaved like a buffer
- the **NI-USRP configure section** was adjusted
- delay was stabilized to **20 seconds**

This is a valuable real-world engineering detail showing that the project tackled not only signal theory but also practical system timing.

---

## 4) ASK Receiver

The receiver estimates frame samples and performs:

- band-pass filtering
- demodulation
- pulse shaping filtering
- downsampling
- matched filtering
- decision making

The recovered signal is then passed to the equalizer and eventually to DAC and audio playback blocks.

---

## 5) DAC Processing

The DAC stage converts digital information back into floating-point analog-like values.

The report states that the DAC side:

- reconstructs 16-bit values from binary groups
- maps them back into partition values
- restores the corrected signal into floating-point output form

This completes the end-to-end digital communication chain.

---

## 6) DSP Equalizer

One of the strongest parts of the project is the **3-channel equalizer** implemented in the receiver DSP section.

The equalizer is divided into:

- **Channel 1:** 20 Hz – 2 kHz  
  Covers bass and midrange

- **Channel 2:** 2 kHz – 8 kHz  
  Covers upper-midrange and presence

- **Channel 3:** 8 kHz – 20 kHz  
  Covers brilliance / treble

The report states that each channel is implemented using **Butterworth Sallen-Key low-pass and high-pass filters**, allowing controlled enhancement or attenuation of different frequency bands.

A separate **volume control** is also included for overall output adjustment.

---

## 7) Audio Playback

To listen to the reconstructed signal, a playback block is used in the receiver.

The report states that:
- playback sampling frequency was set to **8000 Hz**
- bit depth was set to **16 bits/sample**

This allowed the transmitted signal to be successfully played after modulation, demodulation, and reconstruction.

---

## Signal Processing Value

This project is valuable because it combines several major topics into one system:

- digital communication systems
- ASK modulation and demodulation
- LabVIEW-based SDR workflow
- ADC and DAC logic
- DSP equalization
- audio-focused channel improvement

It is not just a simulation or a block-level academic example; it is a practical communication chain built with real hardware and software tools.

---

## Typical Workflow

1. Select or load a song signal
2. Add periodic noise
3. Convert the analog-like signal into digital form using ADC logic
4. Modulate the bitstream using ASK in LabVIEW
5. Transmit through USRP-2900
6. Receive and demodulate the signal
7. Apply equalization across 3 frequency channels
8. Convert digital signal back through DAC
9. Play the resulting sound

---

## Educational and Research Value

This repository is useful for anyone interested in:

- communication systems
- digital modulation
- software-defined radio workflows
- LabVIEW project design
- DSP equalization
- ADC and DAC modeling
- practical ASK system implementation

It can serve as a reference for:
- undergraduate communications labs
- DSP projects
- SDR-based educational projects
- LabVIEW + RF system demonstrations

---

## Report

The repository is supported by the full project report:

```text
EE_3001_Term_Project.pdf
```

The report includes:
- project objective
- ASK TX and RX design
- ADC and DAC details
- synchronization strategy
- equalizer design
- playing audio stage
- final conclusions

---

## Authors

- **Oğuzhan Alasulu**
- **Furkan Durmuş**

GitHub repository owner: [@alasulu](https://github.com/alasulu)

---

## Suggested Citation

```bibtex
@misc{alasulu_labview_ask_equalizer,
  author       = {Oğuzhan Alasulu and Furkan Durmuş},
  title        = {LABVIEW Equalizer ASK Modulation Project},
  year         = {2026},
  howpublished = {\url{https://github.com/alasulu/LABVIEW-Equalizer-ASK-Modulation-Project}}
}
```

---

## Final Note

> This project demonstrates how ASK modulation, DSP equalization, ADC/DAC conversion, and LabVIEW-based SDR design can be combined into a complete and practical audio communication system.

---

## Additional Note

Please arrange the sample rate of filters to obtain the graph for seeing FFT Waveform alteration.
