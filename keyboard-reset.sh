#!/bin/sh
# ^ Tells the system to run this with the standard shell

# The script checks if it's called with "pre" (before sleep) or "post" (after wake)
# $1 = first argument (pre or post)
# $2 = second argument (not used here, but kept for compatibility)
case $1/$2 in
  
  # If script is called with "pre" (before going to sleep)
  pre/*)
    # Unbind (remove) the keyboard driver
    # This tells the kernel to stop using the i8042 driver
    # /sys/ is a virtual filesystem that lets us interact with the kernel
    echo i8042 > /sys/bus/platform/drivers/i8042/unbind
    ;;

  # If script is called with "post" (after waking up)
  post/*)
    # Bind (reload) the keyboard driver
    # This tells the kernel to start using the i8042 driver again
    # This forces the driver to reinitialize, fixing the keyboard
    echo i8042 > /sys/bus/platform/drivers/i8042/bind
    ;;

# End of the case statement
esac
