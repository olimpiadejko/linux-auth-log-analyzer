# Linux Auth Log Analyzer

A Bash script for analyzing failed SSH login attempts from Linux authentication logs.

## Features
- Detects failed logins from `/var/log/auth.log`
- Extracts usernames, source IP addresses and timestamps
- Counts failed attempts
- Performs reverse DNS lookups with `host`
- Generates a security report

## Technologies
- Bash
- grep
- awk
- host (DNS utilities)

## Example Output

Użytkownik: fakeuser
Liczba prób: 3
IP atakującego: ::1
Host: localhost.

## Run

```bash
chmod +x analyze_auth.sh
sudo ./analyze_auth.sh
