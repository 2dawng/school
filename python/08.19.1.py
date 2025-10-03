import requests
from bs4 import BeautifulSoup
import time
import random

# Rotate user agents to appear more like different browsers
user_agents = [
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0',
]

def get_headers():
    return {
        'User-Agent': random.choice(user_agents),
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Language': 'vi-VN,vi;q=0.9,en;q=0.8',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Upgrade-Insecure-Requests': '1',
        'Sec-Fetch-Dest': 'document',
        'Sec-Fetch-Mode': 'navigate',
        'Sec-Fetch-Site': 'none',
        'Cache-Control': 'max-age=0',
    }

url = "https://sjc.com.vn/bieu-do-gia-vang"

def try_request():
    session = requests.Session()
    session.headers.update(get_headers())
    
    # Add some randomization to appear more human-like
    time.sleep(random.uniform(1, 3))
    
    try:
        # First, visit the main page to get cookies
        main_page = session.get("https://sjc.com.vn/", timeout=15)
        time.sleep(random.uniform(0.5, 2))
        
        # Now try the target page
        res = session.get(url, timeout=15)
        res.raise_for_status()
        return res
        
    except Exception as e:
        print(f"Attempt failed: {e}")
        return None

# Try multiple times with different approaches
success = False
for attempt in range(3):
    print(f"Attempt {attempt + 1}...")
    
    try:
        res = try_request()
        if res:
            soup = BeautifulSoup(res.content, "html.parser")
            
            # Try different table selectors
            table = soup.find("table", class_="date-table border border-[#E5E5E5] mt-5 p-5")
            if not table:
                table = soup.find("table", class_="w-full")
            if not table:
                table = soup.find("table")
            
            if table:
                print("Table found!")
                rows = table.find_all("tr")
                data = []
                
                for row in rows:
                    cols = row.find_all(["th", "td"])
                    cols_text = [c.get_text(strip=True) for c in cols]
                    if cols_text:
                        data.append(cols_text)
                
                print(f"Successfully extracted {len(data)} rows:")
                for item in data:
                    print(item)
                
                success = True
                break
            else:
                print("No table found in response")
                # Let's see what we got
                print("Page title:", soup.title.get_text() if soup.title else "No title")
                
    except Exception as e:
        print(f"Attempt {attempt + 1} failed: {e}")
    
    if attempt < 2:  # Don't sleep after last attempt
        time.sleep(random.uniform(3, 6))

if not success:
    print("\n=== All attempts failed ===")
    print("The SJC website is likely blocking automated requests.")
    print("Alternative solutions:")
    print("1. Use a different gold price website")
    print("2. Use selenium with a real browser")
    print("3. Check if SJC has an official API")
    print("4. Use a proxy service")
    
    # Suggest alternative URL
    print("\nTrying alternative gold price source...")
    alt_url = "https://webgia.com/ty-gia/"
    try:
        alt_res = requests.get(alt_url, headers=get_headers(), timeout=15)
        if alt_res.status_code == 200:
            print("Alternative source accessible - consider switching to webgia.com")
    except:
        print("Alternative source also not accessible")