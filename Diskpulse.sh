#!/bin/bash

# Set the Arduino serial port (replace with your actual port)
SERIAL_PORT="/dev/ttyACM0"
BAUD_RATE=9600

# Variables to track previous read and write counts
read_before=0
write_before=0

# Function to check disk activity
check_disk_activity() {
    # Get the number of reads/writes from the disk stats
    read_after=$(cat /sys/class/block/sdd/stat | awk '{print $1}')
    write_after=$(cat /sys/class/block/sdd/stat | awk '{print $5}')

    # Print the read and write activity to the terminal
    echo "Read Before: $read_before, Write Before: $write_before"
    echo "Read After: $read_after, Write After: $write_after"

    # If there is a change in the read or write count, it's disk activity
    if [ "$read_before" != "$read_after" ] || [ "$write_before" != "$write_after" ]; then
        echo "Disk Activity Detected!"

        # Signal Arduino to blink the LED (turn on and then off)
        echo "1" > $SERIAL_PORT  # Turn the LED on (for blinking)
        sleep 0.1               # Wait a short time to make the blink noticeable
        echo "0" > $SERIAL_PORT  # Turn the LED off

        # Update the previous read and write counts for the next check
        read_before=$read_after
        write_before=$write_after
    else
        echo "No Disk Activity"
    fi
}

# Infinite loop to continuously check the disk activity
while true; do
    check_disk_activity
    sleep 0.1  # Check every 1 second
done
