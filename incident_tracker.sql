--===============================
-- CYBERSECURITY INCIDENT TRACKER
-- All-in-One Script (Drop + Create + Insert)
-- ===============================

-- Drop old tables if they exist
DROP TABLE IF EXISTS incident_updates;
DROP TABLE IF EXISTS incident_status;
DROP TABLE IF EXISTS incidents;
DROP TABLE IF EXISTS systems;
DROP TABLE IF EXISTS incident_types;

-- Create tables

-- Table for different types of incidents
CREATE TABLE incident_types (
    type_id INTEGER PRIMARY KEY,
    type_name TEXT NOT NULL,
    description TEXT
);

-- Table for systems affected by incidents
CREATE TABLE systems (
    system_id INTEGER PRIMARY KEY,
    system_name TEXT NOT NULL,
    department TEXT,
    criticality_level TEXT CHECK(criticality_level IN ('Low', 'Medium', 'High'))
);

-- Table for main incident records
CREATE TABLE incidents (
    incident_id INTEGER PRIMARY KEY,
    type_id INTEGER,
    system_id INTEGER,
    reported_date DATE,
    severity TEXT CHECK(severity IN ('Low', 'Medium', 'High', 'Critical')),
    description TEXT,
    FOREIGN KEY (type_id) REFERENCES incident_types(type_id),
    FOREIGN KEY (system_id) REFERENCES systems(system_id)
);

-- Table for status values
CREATE TABLE incident_status (
    status_id INTEGER PRIMARY KEY,
    status_name TEXT
);

-- Table for tracking updates on incidents
CREATE TABLE incident_updates (
    update_id INTEGER PRIMARY KEY,
    incident_id INTEGER,
    status_id INTEGER,
    update_date DATE,
    updated_by TEXT,
    comments TEXT,
    FOREIGN KEY (incident_id) REFERENCES incidents(incident_id),
    FOREIGN KEY (status_id) REFERENCES incident_status(status_id)
);

-- Insert sample data

-- Incident Types
INSERT INTO incident_types VALUES
(1, 'Phishing', 'Email-based credential theft'),
(2, 'Ransomware', 'Malware encrypting files for ransom'),
(3, 'DDoS Attack', 'Overloading server with requests'),
(4, 'Data Breach', 'Unauthorized access to sensitive data');

-- Systems
INSERT INTO systems VALUES
(1, 'Firewall Server', 'Network', 'High'),
(2, 'HR Database', 'HR', 'Medium'),
(3, 'Finance Server', 'Finance', 'High');

-- Status values
INSERT INTO incident_status VALUES
(1, 'Open'),
(2, 'Investigating'),
(3, 'Resolved'),
(4, 'Closed');

-- Incidents
INSERT INTO incidents VALUES
(101, 1, 2, '2025-08-10', 'Medium', 'Phishing email sent to HR team'),
(102, 2, 3, '2025-08-11', 'Critical', 'Ransomware attack on finance server');

-- Incident Updates
INSERT INTO incident_updates VALUES
(1, 101, 2, '2025-08-10', 'Cyber Analyst', 'Investigation started'),
(2, 102, 1, '2025-08-11', 'SOC Engineer', 'Incident reported');

-- ✅ Done: Database created & populated successfully 
