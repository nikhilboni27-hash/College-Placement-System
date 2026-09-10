# College Placement Management System

A Salesforce-based College Placement Management System designed to manage students, companies, job openings, and job applications.

## Project Overview

This project helps a college placement team manage the complete placement process in Salesforce.

The system stores student details, company information, job openings, and student applications.

When a student applies for a job, Apex automatically checks the student's CGPA against the minimum CGPA required for that job and updates the Eligibility Status.

## Features

- Student Management
- Company Management
- Job Opening Management
- Job Application Management
- Automatic Eligibility Checking
- Record-Triggered Flow
- Apex Trigger
- Apex Class
- SOQL
- Bulkification
- Validation Rules
- Apex Test Class
- Reports
- Dashboard

## Salesforce Objects

### Student
Stores student information such as:
- Student ID
- Full Name
- Email
- Branch
- CGPA
- Graduation Year
- Skills
- Placement Status

### Company
Stores company information such as:
- Company ID
- Company Name
- Industry
- Location
- HR Email
- Website

### Job Opening
Stores available job positions:
- Job ID
- Job Title
- Company
- Minimum CGPA
- Required Skills
- Job Location
- Job Type
- Status

### Job Application
Connects a student with a job opening and stores:
- Application ID
- Student
- Job Opening
- Application Date
- Status
- Remarks
- Eligibility Status

## Eligibility Logic

The system compares the student's CGPA with the minimum CGPA required by the job.

Example:

Student CGPA = 8.2  
Minimum CGPA = 7.0

Result:

Eligible

If:

Student CGPA = 6.5  
Minimum CGPA = 7.0

Result:

Not Eligible

## Automation

### Record-Triggered Flow

A Record-Triggered Flow automatically sets the Job Application Status to `Applied` when a new application is created without a status.

### Apex Trigger

The `JobApplicationTrigger` runs before insert and before update.

It calls the `JobApplicationService` Apex class to check eligibility.

### Apex Class

`JobApplicationService` contains the eligibility checking logic.

It uses:

- Sets
- Maps
- SOQL
- Bulkified processing

## Validation Rules

The project contains validation rules to:

- Prevent invalid Student CGPA values
- Prevent invalid Job Opening minimum CGPA values
- Prevent future application dates

## Testing

An Apex Test Class is included to verify the eligibility logic.

Test scenarios include:

- Eligible student
- Not eligible student
- Apex trigger execution
- Eligibility status update

## Reports & Dashboard

The project includes reports for:

- Student Placement Status
- Job Application Eligibility
- Company Job Openings

A Salesforce Dashboard provides a visual overview of placement data.

## Technologies Used

- Salesforce
- Apex
- SOQL
- DML
- Record-Triggered Flow
- Validation Rules
- Reports & Dashboards
- Apex Testing

## Project Structure

```text
College-Placement-Management-System
│
├── README.md
├── Apex
├── Flow
├── Validation-Rules
├── Reports
└── Screenshots
