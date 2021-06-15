from repositories.DataRepository import DataRepository
from flask import Flask, jsonify, request
from flask_cors import CORS
from testfolder import read_temp
from testfolder import LCD

import serial
import time
# Start app
app = Flask(__name__)
CORS(app)

# Custom endpoint
endpoint = '/api/v1'


@app.route(endpoint + '/dranken', methods=['GET'])
def get_dranken():
    if request.method == 'GET':
        return jsonify(dranken=DataRepository.read_dranken()), 200


@app.route(endpoint + '/gebruikers', methods=['GET'])
def get_gebruikers():
    if request.method == 'GET':
        return jsonify(gebruikers=DataRepository.read_users()), 200


@app.route(endpoint + '/dranken/<drankID>', methods=['GET', 'PUT', 'DELETE'])
def get_drank(DrankID):
    if request.method == 'GET':
        return jsonify(DataRepository.read_drank(DrankID))
    elif request.method == 'PUT':
        gegevens = DataRepository.json_or_formdata(request)
        data = DataRepository.update_dranken(gegevens['merk'], gegevens['type_drank'],
                                             gegevens['naam'], gegevens['formaat'], DrankID)
        print(data)
        return jsonify(DrankID=DrankID), 200
    elif request.method == 'DELETE':
        data = DataRepository.delete_trein(DrankID)
        if data > 0:
            return jsonify(status="success", row_count=data), 201
        else:
            return jsonify(status="no update", row_count=data), 201


@app.route(endpoint + '/historiek', methods=['GET'])
def get_historiek():
    if request.method == 'GET':
        return jsonify(historiek=DataRepository.read_history()), 200


def read_temp():
    temp_sensor_file_name = '/sys/bus/w1/devices/28-03199779643c/w1_slave'
    # temp opvragen
    sensor_file = open(temp_sensor_file_name, 'r')
    for i, line in enumerate(sensor_file):
        if i == 1:
            temperature_now = int(line.strip(
                '\n')[line.find('t=')+2:])/1000.0
            return temperature_now
    
    time.sleep(3)
    sensor_file.close()


ser = serial.Serial('/dev/serial0', 9600, timeout=1)
ser.flush()
try:
    while True:
        # if ser.in_waiting > 0:
        line = ser.readline().decode('utf-8').rstrip()
        print(line)
        print(read_temp())
        time.sleep(5)
except KeyboardInterrupt as e:
    print(e)
    ser.close()
finally:
    ser.close()
    print("Script has stopped")


if __name__ == '__main__':
    app.run(debug=True)
    
