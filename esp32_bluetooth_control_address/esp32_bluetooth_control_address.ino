#include "esp_bt_main.h"
#include "esp_gap_bt_api.h"
#include "esp_spp_api.h"
#include <BluetoothSerial.h>

#define relay 15

uint8_t address[6] = {0x68, 0x5D, 0x43, 0x11, 0x2F, 0xBE};
String MACadd = "xx:xx:xx:xx:xx:xx";// input Mac Address Bluetooth

static const esp_spp_sec_t sec_mask = ESP_SPP_SEC_NONE;
static const esp_spp_role_t role_slave = ESP_SPP_ROLE_MASTER;
esp_err_t connHan;


BluetoothSerial SerialBT;

void setup() {
  Serial.begin(115200);
  pinMode(relay, OUTPUT);
  Serial.println("Ready!!!...");
  SerialBT.begin("reset");
  Serial.println("Looking for device...");
}

void loop() {
  for (int i = 0; i <= 5; i++) {
    if (esp_spp_start_discovery(address) == ESP_OK) {
      Serial.println("Device found!");
    }
    else {
      Serial.println("Device not found");
    }

    connHan = esp_spp_connect(ESP_SPP_SEC_NONE, ESP_SPP_ROLE_MASTER, 3, address);
    if (connHan == ESP_OK) {
      Serial.println("Device connected!");
    }
    else {
      Serial.println("Device not connected");
    }
    delay(1000);

    if (SerialBT.hasClient() == true) {
      int ble_rssi = advertisedDevice.getRSSI();
      Serial.println("RSSI: " + String(ble_rssi));
      digitalWrite(relay, LOW);
      Serial.print("Client connected");
    }
    else {
      digitalWrite(relay, HIGH);
      Serial.println("Client disconnected");
      esp_spp_disconnect(connHan);
      SerialBT.begin("reset");
      delay(1500);
    }
    delay(1000);
  }
}
