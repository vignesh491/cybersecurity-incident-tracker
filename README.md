# Cybersecurity Incident Tracker
This project is an SQL-based system to record, track, and analyze cybersecurity incidents.
## Features
- Stores incident details
- Tracks affected systems
- Records status updates
- Pre-loaded with sample data
## Files
- incident_tracker.sql : Main SQL script (drop + create + insert sample data)
## Usage
1. Open SQLite (or any SQL tool)
2. Run incident_tracker.sql
3. Use SELECT queries to explore
## Example Query
SELECT * FROM incidents WHERE severity='Critical';
