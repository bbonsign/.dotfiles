#!/usr/bin/env python

from datetime import datetime
from subprocess import check_output
from sys import stdout

from psutil import disk_usage, sensors_battery
from psutil._common import bytes2human


def write(data):
    stdout.write(f"%s\n" % data)
    stdout.flush()


def refresh():
    disk = bytes2human(disk_usage("/").free)
    try:
        ssid = check_output("iwgetid -r", shell=True).strip().decode("utf-8")
        ssid = "(%s)" % ssid
    except Exception:
        ssid = "None"
    battery_percent = int(sensors_battery().percent)
    battery = (
        " "
        if battery_percent >= 90
        else " "
        if battery_percent >= 70
        else " "
        if battery_percent >= 40
        else " "
        if battery_percent >= 15
        else " "
    )
    battery_status = " " if sensors_battery().power_plugged else "↯"
    date = datetime.now().strftime("%h %d %A %H:%M")
    utc_date = str(datetime.utcnow())[:16]
    write(
        f"🖴 {disk} ‖ {battery_status}{battery} {battery_percent}% ‖ 🌍 {utc_date} ‖  {date}  "
    )


if __name__ == "__main__":
    refresh()
