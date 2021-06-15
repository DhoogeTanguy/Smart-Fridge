import time

class temp:
    def read_temp():
        temp_sensor_file_name = '/sys/bus/w1/devices/28-03199779643c/w1_slave'
        # temp opvragen
        sensor_file = open(temp_sensor_file_name, 'r')
        for i, line in enumerate(sensor_file):
            if i == 1:
                temperature_now = int(line.strip(
                    '\n')[line.find('t=')+2:])/1000.0
                print(temperature_now)
        time.sleep(3)
        sensor_file.close()





# from RPi import GPIO
# import math 
# import time
# import LCD1602 as LCD
# rs = 21
# e = 20

# GPIO.setmode(GPIO.BOARD)

#     def setup():
#             GPIO.setup(rs, GPIO.OUT)
#             GPIO.setup(e, GPIO.OUT)
#             LCD.init(0x27,1)

#     def read_temp():
#         temp_sensor_file_name = '/sys/bus/w1/devices/28-03199779643c/w1_slave'
#         # temp opvragen
#         sensor_file = open(temp_sensor_file_name, 'r')
#         for i, line in enumerate(sensor_file):
#             if i == 1:
#                 temperature_now = int(line.strip(
#                     '\n')[line.find('t=')+2:])/1000.0
#                 print(temperature_now)
#                 LCD.write(0,0,'temperature: {} °C'. format(temperature_now))
#         time.sleep(3)
#         sensor_file.close()

# if __name__ == '__main__':
#     try: 
#         read_temp()
#     except KeyboardInterrupt as e:
#         print(e)