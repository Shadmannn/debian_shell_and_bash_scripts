# Collection of useful shell/bash scripts for Linux systems.

---

## Why This Repository?

I created this repository to share useful shell scripts that solve common Linux problems. Instead of searching for solutions every time, I keep all my scripts in one place.

---

## 1. keyboard-reset.sh

**Works in every Linux distro!**

**Fixes built-in laptop keyboard not working after sleep/wake**

---

## The Problem

When you close your laptop lid or put it to sleep, the built-in keyboard sometimes stops working after waking up.

**Why this happens:**
- When laptop goes to sleep, the system unloads the keyboard driver to save power
- When waking up, the driver (i8042) sometimes fails to reinitialize properly
- The keyboard remains unresponsive even though the system is awake

**Symptoms:**
- Built-in keyboard doesn't type anything
- External USB keyboard still works
- Touchpad still works
- Only the keyboard is affected

---

## How to Run It

### Step 1: Make the script executable (first time only)
```bash
chmod +x keyboard-reset.sh
```
### Step 2: Run the script

```bash
sudo ./keyboard-reset.sh
```
### You don't have to run this every time! Just run this and this problem will be gone. If not, run it again.

---

## 2. up.sh 

**Complete system update script for Debian-based systems**

**What it does:**
- Updates package lists
- Upgrades all installed packages
- Removes unnecessary packages
- Cleans the package cache

**Why use this?** Instead of typing 4 separate commands every time, just run one script!

---

## How to Run It

### Step 1: Make the script executable (first time only)
```bash
chmod +x up.sh
```
### Step 2: Run the script
```bash
./up.sh
```

---

## 3. run.sh

**Interactive compilation and execution script for multi-language projects**

**Works in every Linux distro!**

**What it does:**

* Prompts for directory location (e.g, From Dolphin Manager in KDE Plasma), file name, language, and compiler
* Supports Java, C, C++, and Python with sensible default compilers
* Handles automatic compilation and execution in a single step
* Validates directory paths and file existence to prevent runtime errors

**Why use this?** Instead of manually switching directories, compiling files, and executing binaries with separate commands, just run one script!

### How to copy directory paths from File Managers:

- **Terminal:** Run `pwd` to print and copy your current directory path.
- **Nautilus (GNOME):** Press `Ctrl + L` to highlight the address bar, then `Ctrl + C` to copy the path.
- **Dolphin (KDE Plasma):** Press `Ctrl + L` to copy the address bar path, or right-click a folder and select **Copy Location** (`Ctrl + Alt + C`).

---

## How to Run It

### Step 1: Make the script executable (first time only)

```bash
chmod +x run.sh
```
### Step 2: Run the script

```bash
./run.sh
```
