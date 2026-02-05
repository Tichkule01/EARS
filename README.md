# 🚨 EARs – Emergency Accident & Response System 

EARs is a full-fledged emergency response system designed to streamline accident reporting and emergency dispatch. It supports real-time incident tracking, severity-based prioritization, responder assignment and data-driven decision-making.

---

## 🏗️ Architecture Overview

```

User (Web)
|
v
EARs Frontend (JSP + JS)
|
v
Controller Layer (Servlets)
|
v
Service Layer (Business Logic)
|
v
DAO Layer (Oracle DB)

````

- **Frontend**: JSP, HTML, CSS, JS, JSTL, Leaflet.js (Live Map)
- **Backend**: Java, Servlets, JDBC
- **Database**: Oracle DB (with normalized tables for accidents, responders, emergency requests)
- **Integration**: Optional SMS/email alerts via external APIs
- **Deployment**: Apache Tomcat, production-ready JDBC pooling, secure connection

---

## 📦 Features (Production Focus)

### Core Functionality
- Accident reporting with severity (High/Medium/Low)
- Emergency request creation and assignment
- Real-time status updates
- Role-based access control (User, Police, Ambulance, Admin)
- Response time calculation & logging

### Production Enhancements
- **Live Map Integration**: Real-time accident and responder locations
- **Priority Queue & Auto Dispatch**: High severity incidents handled first
- **Notifications**: Email/SMS alerts for high-priority incidents
- **Audit Logs**: Track all updates and actions by role
- **Analytics Dashboard**: Accident trends, hotspots, response performance
- **Data Validation**: Prevent duplicate or fake reports
- **Scalability Ready**: Supports multiple simultaneous requests
- **Security Measures**: Role-based authentication, prepared statements to prevent SQL injection

---

## ⚡ Database Schema (Simplified)

**Accidents Table**
- `accident_id` (PK)
- `user_id` (FK)
- `latitude`, `longitude`
- `severity` (HIGH/MEDIUM/LOW)
- `status` (REPORTED / ASSIGNED / RESOLVED)
- `accident_time` (TIMESTAMP)

**Emergency Requests Table**
- `request_id` (PK)
- `accident_id` (FK)
- `assigned_to` (responder ID)
- `responder_type` (POLICE / AMBULANCE)
- `status` (PENDING / EN_ROUTE / ARRIVED / RESOLVED)
- `response_time` (TIMESTAMP)

---


## 🔄 Project Status

### ✅ Completed

- **Accident Reporting**: Users can report accidents with location (lat/lng), severity, timestamp, and optional notes.
- **Emergency Request Assignment**: System assigns requests to available responders (police/ambulance) based on proximity and availability.
- **Role-Based Access**: Users, Responders, and Admin roles implemented with access control. 
- **Response Time Logging**: Tracks timestamp for reported, assigned, arrived, and resolved incidents.  
- **Live Accident Listing**: Admin dashboard shows current accidents with status and severity.

### 🔄 In-Progress

- **Live Map Integration**: Real-time visualization of accidents and responders (using Leaflet/Google Maps).
- **Traffic Analytics & Heatmap**: Module to analyze traffic conditions and suggest fastest responder routes.

### ⏳ Future Plans

- **Automated SMS/Email Alerts**: Notify responders and users for high-severity accidents.
- **AI-Based Severity Prediction**: Predict risk levels based on location, traffic, and historical data.
- **Offline Accident Reporting**: Allow offline submission with auto-sync when internet is available.

---

---

## **ER Diagram & Data Flow (Completed Modules)**

Below is a conceptual **Entity-Relationship (ER) diagram** for the **modules completed so far**. It explains how **accidents, emergency requests, and responders** interact.

```
+----------------+         
|    User        |          
|----------------|        
| user_id (PK)   |        
| name           |          
| role           |          
+----------------+          
        |                 
        |                   
        |                  
        |                            
        |                            
        v                            
+----------------+          +---------------------+
|   Accident     |<-------->| Emergency_Request   |
|----------------|          |--------------------|
| accident_id(PK)|          | request_id (PK)     |
| user_id (FK)   |          | accident_id (FK)    |
| latitude       |          | responder_id (FK)   |
| longitude      |          | status              |
| severity       |          | response_time       |
| status         |          +--------------------+
| accident_time  |
+----------------+
```

### **Flow Description (Completed Part)**

1. **User reports accident** → accident stored in `Accident` table.
2. **System creates Emergency Request** → assigns to nearest available responder.
3. **Responder receives request** → updates status (`En Route`, `Arrived`, `Resolved`).
4. **Response timestamps** are logged for monitoring performance.
5. **Admin dashboard** can view accidents, responder assignment, and current statuses.

> Note: **Live map and traffic modules are in progress** and will enhance this flow with **real-time visualization** and **traffic-aware routing**.

---

## ✅ Key Points About Completed Features

* Fully functional **database backend** (Oracle) with normalized tables.
* **Role-based access** ensures security between Users, Responders, and Admin.
* **Timestamp tracking** enables performance analysis for emergency response.
* Modular design allows **easy integration** with future modules like Galli Maps and traffic analytics.

---

# Flowchart

**Flow Overview:**

```
[User] 
   |
   v
[Report Accident Form]
   |
   v
[Accident Service / Backend]
   | stores in DB (Accident Table)
   v
[Emergency Request Generator]
   |
   v
[Assign Nearest Responder]
   | (based on availability & proximity)
   v
[Responder]
   | updates status: En Route → Arrived → Resolved
   v
[DB Logs Response Time]
   |
   v
[Admin Dashboard / User View]
   | shows accidents, responder status, severity
```

---

## **Step-by-Step Flow**

1. **User Reports Accident**

   * Inputs: Location (lat/lng), severity, optional notes
   * Timestamp recorded (`accident_time`)

2. **Accident Stored in Database**

   * Table: `Accidents`
   * Fields: `accident_id`, `user_id`, `latitude`, `longitude`, `severity`, `status`, `accident_time`

3. **Emergency Request Created**

   * Table: `Emergency_Requests`
   * System assigns available responder (Police/Ambulance)
   * Logs `assigned_time`

4. **Responder Receives Request**

   * Updates status: `En Route` → `Arrived` → `Resolved`
   * Response timestamp stored in `response_time`

5. **Admin / Dashboard Updates**

   * Shows all active accidents, severity, and responder status
   * Completed accidents are logged for analytics

---

### 🔥 Flowchart Key Points

* Simple, **linear flow** → easy for stakeholders to understand
* Modular → easy to integrate **Live Map + Traffic Analytics** later
* Shows **data storage** and **status updates** clearly

---

## 👤 Author

**Himanshu Bhandari**
