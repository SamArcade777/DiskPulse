const int ledPin = 13;  // Pin connected to the built-in LED

void setup() {
  pinMode(ledPin, OUTPUT);  // Set the LED pin as an output
  Serial.begin(9600);       // Start serial communication
}

void loop() {
  if (Serial.available() > 0) {  // Check if data is available from the serial port
    char activity = Serial.read();  // Read the incoming data
    
    if (activity == '1') {
      // If activity detected, blink the LED faster
      digitalWrite(ledPin, HIGH);  // Turn the LED on
      delay(50);                   // Wait for a shorter period (50ms for faster blink)
      digitalWrite(ledPin, LOW);   // Turn the LED off
      delay(50);                   // Wait for a shorter period (50ms for faster blink)
    }
    else if (activity == '0') {
      // If no activity, keep the LED off
      digitalWrite(ledPin, LOW);   // Ensure the LED is off
    }
  }
}
