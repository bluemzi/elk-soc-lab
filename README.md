# elk-soc-lab
## ELK Stack SIEM Home Lab


### Short description:
A home lab I built to practice SIEM tools and log analysis.
The ELK stack runs on Docker on an Ubuntu VM, Filebeat collects auth.log events, and I simulate real SSH brute force attacks using Hydra.


### Why I built this:
I'm transitioning into a SOC Analyst role and I believe hands-on experience with these tools is just as important as theoretical knowledge. I have 6 years of Linux admin experience but SIEM and detection engineering is a new area for me that I'm actively developing.
What the lab includes:

### ELK stack running via Docker Compose
- Filebeat configured to ingest auth.log
- GeoIP enrichment pipeline — IP address to country/city mapping
- SSH brute force simulation using Hydra with a real wordlist
- GeoIP simulation with real public IPs from multiple countries
- Kibana dashboard — failed logins over time, top source IPs, targeted usernames
- SIEM alert rule for brute force detection

### Tech stack:

- Elasticsearch 8.12.0
- Kibana 8.12.0
- Filebeat 8.12.0
- Docker + Docker Compose
- Ubuntu Server 22.04
- Hydra

### Detection Rules:

SSH Brute Force — Triggers when more than 10 failed login attempts occur from the same IP within 1 minute
Invalid User Login Attempts — Detects repeated login attempts using non-existent usernames
Geographic Anomaly — Flags login attempts originating from high-risk countries

### How to run:
```
git clone https://github.com/bluemzi/elk-soc-lab.git
cd elk-soc-lab
./scripts/elk.sh
```

### What I learned:

How Elasticsearch ingest pipelines work
GeoIP enrichment on log data
Writing KQL queries in Kibana
Creating rules in Kibana
Recognizing brute force attack patterns in logs


![Kibana Dashboard](screenshots/Dashboard.jpg)
