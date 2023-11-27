import machine
from time import sleep
from usocket import socket
import network

# Set up the servo motor
servo_pin = 18  # GPIO pin connected to the servo
servo = machine.PWM(machine.Pin(servo_pin), freq=50)

# Set up Wi-Fi
ssid = "Internet"
password = "Hplaptop!2"
station = network.WLAN(network.STA_IF)
station.active(True)
station.connect(ssid, password)

# Wait for the Wi-Fi connection to be established
while not station.isconnected():
    pass

print("Connected to Wi-Fi")

# Create a simple HTTP server
def start_server():
    s = socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('', 80))
    s.listen(5)

    print("Server listening on port 80")

    while True:
        conn, addr = s.accept()
        request = conn.recv(1024)
        request = str(request)

        # Check if the request is for controlling the servo
        if "GET /?servo=" in request:
            angle_start = request.find("=") + 1
            angle_end = request.find(" ", angle_start)
            angle = int(request[angle_start:angle_end])

            # Map the angle to the servo range (adjust as needed)
            angle = max(0, min(angle, 180))
            duty = int(((angle / 180.0) * 10) + 2)

            # Control the servo
            servo.duty(duty)

        # Send a simple HTML response
        response = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"
        response += "<html><body><h1>Servo Control</h1>"
        response += "<p>Current Angle: {}</p>".format(angle)
        response += "</body></html>"

        conn.send(response)
        conn.close()

start_server()
