from .Database import Database


class DataRepository:
    @staticmethod
    def json_or_formdata(request):
        if request.content_type == 'application/json':
            gegevens = request.get_json()
        else:
            gegevens = request.form.to_dict()
        return gegevens

    @staticmethod
    def read_dranken():
        sql = "SELECT * from Drank"
        return Database.get_rows(sql)

    @staticmethod
    def read_drank(DrankID):
        sql = "select * from Drank where DrankID = %s "
        params = [DrankID]
        return Database.get_one_row(sql, params)

    @staticmethod
    def read_sensor(sensorID):
        sql = "select * from Sensor where sensorID = %s "
        params = [sensorID]
        return Database.get_one_row(sql, params)

    @staticmethod
    def read_user(gebruikerID):
        sql = "select * from gebruikers where gebruikerID = %s "
        params = [gebruikerID]
        return Database.get_one_row(sql, params)

    @staticmethod
    def read_users():
        sql = "select * from gebruikers"
        return Database.get_rows(sql)

    @staticmethod
    def create_user(gebruikerID, gebruikersnaam, wachtwoord, emailadres, voornaam, achternaam):
        sql = "INSERT INTO gebruikers(gebruikerID, gebruikersnaam, wachtwoord, emailadres, voornaam, achternaam) VALUES(%s,%s,%s,%s,%s,%s)"
        params = [gebruikerID, gebruikersnaam,
                  wachtwoord, emailadres, voornaam, achternaam]
        return Database.execute_sql(sql, params)

    @staticmethod
    def create_sensor(sensorDataID, meetdatum, drankID, sensorID, waarde):
        sql = "INSERT INTO Sensor(sensorDataID, meetdatum, drankID, sensorID, waarde) VALUES(%s,%s,%s,%s,%s) "
        params = [sensorDataID, meetdatum, drankID, sensorID, waarde]
        return Database.execute_sql(sql, params)

    @staticmethod
    def create_drank(DrankID, merk, type_drank, naam, formaat):
        sql = "INSERT INTO Drank(DrankID, merk, type_drank, naam, formaat) VALUES(%s,%s,%s,%s,%s)"
        params = [DrankID, merk, type_drank, naam, formaat]
        return Database.execute_sql(sql, params)

    @staticmethod
    def read_history():
        sql = " select * from verbruik"
        return Database.get_rows(sql)

    @staticmethod
    def update_dranken(DrankID, merk, type_drank, naam, formaat):
        sql = "UPDATE Drank SET merk = %s, type_drank = %s, naam = %s, formaat = %s WHERE DrankID = %s"
        params = [DrankID, merk, type_drank, naam, formaat]
        print(sql)
        return Database.execute_sql(sql, params)

    @staticmethod
    def delete_Drank(DrankID):
        sql = "DELETE from Drank WHERE DrankID = %s"
        params = [DrankID]
        return Database.execute_sql(sql, params)
