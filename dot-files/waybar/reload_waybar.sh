#!/bin/sh
#
killall waybar

sleep 1

waybar -l info &
