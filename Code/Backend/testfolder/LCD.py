from RPi import GPIO
from subprocess import check_output
import time
import spidev

rs = 21
e = 20
databits = [13, 19, 26, 23, 24, 25, 12, 16]
class LCD:
    def setup(self):
        print("In setup")
        GPIO.setwarnings(False)
        GPIO.setmode(GPIO.BCM)
        # b) Initialiseer alle GPIO pinnen.
        GPIO.setup(rs, GPIO.OUT)
        GPIO.setup(e, GPIO.OUT)
        for bit in databits:
            GPIO.setup(bit, GPIO.OUT)
        LCD().init_LCD()
            
    def send_instruction(self, value):
        #print("In send_instruction")
        #rs laag: voor instruction
        GPIO.output(rs, GPIO.LOW)
        #enable hoog
        GPIO.output(e, GPIO.HIGH)
        LCD().set_data_bits(value)
        #enable terug laag
        GPIO.output(e, GPIO.LOW)
        time.sleep(0.01)

    def send_character(self, character):
        #print(f"In send_character    -----{character}-----")
        #rs hoog: voor data
        GPIO.output(rs, GPIO.HIGH)
        #enable hoog
        GPIO.output(e, GPIO.HIGH)
        #data klaarzetten
        LCD().set_data_bits(character)
        #enable laag
        GPIO.output(e, GPIO.LOW)
        #wait
        time.sleep(0.00001)

    def set_data_bits(self, byte):
        #print(f"In set_data_bits    -----{byte}-----")
        mask = 0x80
        for i in range(8):
            GPIO.output(databits[i], byte & (mask >> i))
            #print(f"sending         -----{databits[i]}-----")

    def write_message(self, message):
        #print(f"In write_message     -----{message}-----")
        for char in message[0:16]:
            LCD().send_character(ord(char))
        for char in message[16:]:
            LCD().send_character(ord(char))

    def init_LCD(self):
        print("In init_LCD")
        # set datalengte op 8 bit (= DB4 hoog), 2 lijnen (=DB3), 5x7 display (=DB2).
        LCD().send_instruction(0b00111000)
        # display on (=DB2), cursor on (=DB1), blinking on (=DB0)
        LCD().send_instruction(0b00001111)
        # clear display en cursor home (DB0 hoog)
        LCD().send_instruction(0b00000001)

    def set_cursor(self, row, col):
        #print("In set_cursor")
        # byte maken: row (0 of 1) = 0x0* voor rij 0 of 0x4* voor rij 1. col = 0x*0 - 0x*F 
        byte = row << 6 | col
        # byte | 128 want DB7 moet 1 zijn
        LCD().send_instruction(byte | 128)
    
