import serial
import time

ser = serial.Serial('/dev/serial0', 9600, timeout=1)
ser.flush()
try:
    while True:
        # if ser.in_waiting > 0:
        line = ser.readline().decode('utf-8').rstrip()
        print(line)
except KeyboardInterrupt as e:
    print(e)
    ser.close()
finally:
    ser.close()
    print("Script has stopped")
