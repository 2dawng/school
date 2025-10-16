from flask import Flask, jsonify, request
import time
from collections import defaultdict

app = Flask(__name__)

USERS={"admin":"booyah"}

# IP-based rate limiting
ATTEMPT_BY_IP = defaultdict(list)
LOCKED_UNTIL_IP = {}
MAX_ATTEMPTS = 5
WINDOW_SECONDS = 60
LOCK_DURATION = 300  # 5 minutes

def is_locked(ip):
    t=LOCKED_UNTIL_IP.get(ip, 0)
    return t>time.time()

def record_attempt(ip):
    now = time.time()
    ATTEMPT_BY_IP[ip].append(now)
    ATTEMPT_BY_IP[ip] = [t for t in ATTEMPT_BY_IP[ip] if now - t <= WINDOW_SECONDS]


@app.route('/login', methods=['POST'])
def login():
    data = request.json
    username = data.get('username')
    password = data.get('password')
    
    # Get client IP address (with test mode for IP rotation simulation)
    # In real world, use: client_ip = request.remote_addr
    # For testing, allow custom IP via header
    client_ip = request.headers.get('X-Forwarded-For', request.remote_addr)
    now = time.time()
    
    # Check if IP is locked
    if is_locked(client_ip):
        return jsonify({"status": "error", "message": "Too many attempts from your IP. Try again later."}), 403
    
    # Record this attempt
    record_attempt(client_ip)
    attempts = len(ATTEMPT_BY_IP[client_ip])
    
    # Lock IP if too many attempts
    if attempts > MAX_ATTEMPTS:
        LOCKED_UNTIL_IP[client_ip] = now + LOCK_DURATION
        ATTEMPT_BY_IP[client_ip] = []
        return jsonify({"status": "error", "message": "Too many failed attempts. Your IP has been locked."}), 403
    
    # Check credentials
    real = USERS.get(username)
    if real and real == password:
        ATTEMPT_BY_IP[client_ip] = []  # Clear attempts on success
        return jsonify({"status": "success", "message": "Login successful."})
    else:
        return jsonify({"status": "error", "message": "Invalid credentials."}), 401

if __name__ == '__main__':
    app.run(debug=True, port=4500)
    