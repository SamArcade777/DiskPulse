# DiskPulse 💡

**Reignite the nostalgia of blinking hard drive LEDs.**

DiskPulse is a simple project that recreates the once-ubiquitous disk activity LED using an Arduino Uno and a lightweight Bash script. Perfect for those who miss the visual feedback of their laptop's drive in action.

---

## 🧠 Why?

Modern laptops often ditch the physical disk activity LED. For hardware geeks, power users, or retro computing fans, this is a handy — and visually satisfying — way to monitor I/O activity.

---

## ⚙️ How It Works

- A **Bash script** on your Linux system monitors disk I/O (via `/proc/diskstats` or `iostat`).
- It sends signals via **USB serial** to an **Arduino Uno**.
- The Arduino toggles an LED based on disk read/write activity.

---

## 🛠 Requirements

- Linux (tested on Arch Linux)
- Arduino Uno (or compatible)
- USB connection between PC and Arduino
- Basic LED + resistor (wired to a digital output pin)
- `iostat` or access to `/proc/diskstats`
- `screen` or `minicom` (for testing serial)

---

## 🚀 Installation

### 1. Flash Arduino

Upload the provided `arduino/disk_led.ino` sketch to your Arduino Uno. It listens over serial and blinks an LED when it receives "1", and turns off on "0".

### 2. Connect the LED

Wire an LED with a 220Ω resistor to **Pin 13** (or your preferred pin).

### 3. Run the Bash Monitor

```bash
bash disk_led.sh /dev/ttyACM0
