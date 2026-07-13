## Collection of useful shell scripts for Linux systems.

---

## Why This Repository?

I created this repository to share useful shell scripts that solve common Linux problems. Instead of searching for solutions every time, I keep all my scripts in one place.

---

# 1. keyboard-reset.sh

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

### Step 1: Make the script executable
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

### Step 1: Make the script executable
```bash
chmod +x up.sh
```
### Step 2: Run the script
```bash
./up.sh
```
