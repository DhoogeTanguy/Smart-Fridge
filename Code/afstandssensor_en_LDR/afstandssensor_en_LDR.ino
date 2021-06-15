
int Trigger = 13;
int Echo = 12;
int Led = 7;
int Ldr = A0;
int slot = 8;

void setup() {
  pinMode(Trigger, OUTPUT);
  pinMode(Echo, INPUT);
  pinMode(Led, OUTPUT);
  pinMode(Ldr, INPUT);
  pinMode(slot, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  digitalWrite(Trigger, LOW);
  delay(200);
  digitalWrite(Trigger, HIGH);
  delay(1000);
  digitalWrite(Trigger, LOW);
  int StatusLDR = analogRead(Ldr);
  if (StatusLDR <=1000) {
  digitalWrite(slot, LOW); 
  digitalWrite(Led, HIGH);
  Serial.println("Koelkast staat open!");
  }
  else {
  digitalWrite(slot, HIGH);
  digitalWrite(Led, LOW);
  Serial.println("Koelkast dicht");
  }
  

  long duration = pulseIn(Echo, HIGH);
  int afstand_tot_drank = duration / 29 / 2;
  if (afstand_tot_drank >= 17) {
    Serial.println("Geen dranken gedetecteerd!!!");
  }
  else {
    Serial.println("Er zitten nog dranken in op: " + String(afstand_tot_drank) + " cm!");
  }
  delay(1000);
}
