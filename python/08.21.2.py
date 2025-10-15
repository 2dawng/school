import sys
import requests
import re

must_headers = [
    "content-security-policy",
    "strict-transport-security", 
    "x-content-type-options",
    "x-frame-options",  # block CSP frame-ancestors
    "referrer-policy",
    "permissions-policy",
]

def grade(headers):
    missing = [h for h in must_headers if h not in headers]
    return ("A", []) if not missing else ("C" if len(missing) <=2 else "F", missing)

def cookie_flags(set_cookie_values):
    issue = []
    for c in set_cookie_values:
        if "secure" not in c.lower(): issue.append(f"Cookie thieu secure: {c.split(';')[0]}")
        if "httponly" not in c.lower(): issue.append(f"Cookie thieu HttpOnly: {c.split(';')[0]}")
        if "samesite" not in c.lower(): issue.append(f"Cookie thieu SameSite: {c.split(';')[0]}")
    return issue

if __name__ == "__main__":
    try:
        r = requests.get("https://www.utc.edu.vn", timeout=20)
        hdrs = {k.lower(): v for k, v in r.headers.items()}
        print(f"URL: {r.url} | status: {r.status_code}")
        print("Security headers")
        for h in must_headers:
            print(f"{h}: {hdrs.get(h, '(missing)')}")
        g, miss = grade(hdrs)
        print(f"\n danh gia : {g} | Thieu: {', '.join(miss) if miss else 'khong'}")
        
        # cookie
        sc = r.headers.get("Set-Cookie", "")
        if sc:
            issue = cookie_flags(re.split(r", (?=[^;]+=)", sc))
            print("Cookie flag:")
            if issue:
                for i in issue:
                    print("-",i)
            else:
                print("cookie da co secure, HttpOnly, va SameSite")
        else:
            print("khong thay set cookie")

        for l in ("server", "x-powered-by"):
            print(f"\nluu y header lo thong tin ({l}:{hdrs[1]}) can nhac an/chuan hoa")
    except Exception as e:
        print(f"Error: {e}")