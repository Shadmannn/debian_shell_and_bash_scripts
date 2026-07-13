#!/bin/sh
case $1/$2 in
  pre/*)
    echo i8042 > /sys/bus/platform/drivers/i8042/unbind
    ;;
  post/*)
    echo i8042 > /sys/bus/platform/drivers/i8042/bind
    ;;
esac
