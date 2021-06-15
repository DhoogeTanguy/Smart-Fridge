import time
from RPi import GPIO

try:
    while True:
        temp_sensor_file_name = '/sys/bus/w1/devices/28-03199779643c/w1_slave'
        # temp opvragen
        sensor_file = open(temp_sensor_file_name, 'r')
        for i, line in enumerate(sensor_file):
            if i == 1:
                temperature_now = int(line.strip(
                    '\n')[line.find('t=')+2:])/1000.0
                print(temperature_now)
        time.sleep(3)

except KeyboardInterrupt as e:
    print("\nHet programma is gestopt.")
finally:
    sensor_file.close()

