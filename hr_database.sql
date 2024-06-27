-- Creating the HR Schema

-- Create the JOBS table
CREATE TABLE jobs (
   job_id VARCHAR2(10) PRIMARY KEY,
   job_title VARCHAR2(35) NOT NULL,
   min_salary NUMBER(6),
   max_salary NUMBER(6)
);

-- Create the DEPARTMENTS table
CREATE TABLE departments (
   department_id NUMBER(4) PRIMARY KEY,
   department_name VARCHAR2(30) NOT NULL,
   manager_id NUMBER(6),
   location_id NUMBER(4)
);

-- Create the EMPLOYEES table
CREATE TABLE employees (
   employee_id NUMBER(6) PRIMARY KEY,
   first_name VARCHAR2(20),
   last_name VARCHAR2(25) NOT NULL,
   email VARCHAR2(25) NOT NULL,
   phone_number VARCHAR2(20),
   hire_date DATE NOT NULL,
   job_id VARCHAR2(10) NOT NULL,
   salary NUMBER(8,2),
   commission_pct NUMBER(2,2),
   manager_id NUMBER(6),
   department_id NUMBER(4),
   CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES jobs (job_id),
   CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

-- Create the JOB_HISTORY table
CREATE TABLE job_history (
   employee_id NUMBER(6) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL,
   job_id VARCHAR2(10) NOT NULL,
   department_id NUMBER(4) NOT NULL,
   PRIMARY KEY (employee_id, start_date),
   CONSTRAINT fk_jh_employee FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
   CONSTRAINT fk_jh_job FOREIGN KEY (job_id) REFERENCES jobs (job_id),
   CONSTRAINT fk_jh_department FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

-- Create the LOCATIONS table
CREATE TABLE locations (
   location_id NUMBER(4) PRIMARY KEY,
   street_address VARCHAR2(40),
   postal_code VARCHAR2(12),
   city VARCHAR2(30) NOT NULL,
   state_province VARCHAR2(25),
   country_id CHAR(2)
);

-- Create the COUNTRIES table
CREATE TABLE countries (
   country_id CHAR(2) PRIMARY KEY,
   country_name VARCHAR2(40),
   region_id NUMBER(10)
);

-- Create the REGIONS table
CREATE TABLE regions (
   region_id NUMBER(10) PRIMARY KEY,
   region_name VARCHAR2(25)
);

-- Adding Sample Data

-- Insert data into REGIONS table
INSERT INTO regions VALUES (1, 'Europe');
INSERT INTO regions VALUES (2, 'Americas');
INSERT INTO regions VALUES (3, 'Asia');
INSERT INTO regions VALUES (4, 'Middle East and Africa');

-- Insert data into COUNTRIES table
INSERT INTO countries VALUES ('IT', 'Italy', 1);
INSERT INTO countries VALUES ('JP', 'Japan', 3);
INSERT INTO countries VALUES ('US', 'United States of America', 2);
INSERT INTO countries VALUES ('CA', 'Canada', 2);
INSERT INTO countries VALUES ('CN', 'China', 3);
INSERT INTO countries VALUES ('IN', 'India', 3);

-- Insert data into LOCATIONS table
INSERT INTO locations VALUES (1000, '1297 Via Cola di Rie', '00989', 'Roma', 'RM', 'IT');
INSERT INTO locations VALUES (1100, '93091 Calle della Testa', '10934', 'Venice', 'VE', 'IT');
INSERT INTO locations VALUES (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', NULL, 'JP');
INSERT INTO locations VALUES (1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP');
INSERT INTO locations VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'TX', 'US');
INSERT INTO locations VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'CA', 'US');
INSERT INTO locations VALUES (1600, '2007 Zagora St', '50090', 'Seattle', 'WA', 'US');
INSERT INTO locations VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'WA', 'US');
INSERT INTO locations VALUES (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'ON', 'CA');
INSERT INTO locations VALUES (1900, '6092 Boxwood St', 'Y8Y 1X3', 'Whitehorse', 'YT', 'CA');
INSERT INTO locations VALUES (2000, '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN');
INSERT INTO locations VALUES (2100, '1298 Vileparle (E)', '490231', 'Bombay', 'MH', 'IN');
INSERT INTO locations VALUES (2200, '12-98 Victoria Street', NULL, 'Singapore', NULL, 'SG');
INSERT INTO locations VALUES (2300, '198 Clementi North', '540198', 'Singapore', NULL, 'SG');

-- Insert data into DEPARTMENTS table
INSERT INTO departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO departments VALUES (30, 'Purchasing', 114, 1700);
INSERT INTO departments VALUES (40, 'Human Resources', 203, 2400);
INSERT INTO departments VALUES (50, 'Shipping', 121, 1500);
INSERT INTO departments VALUES (60, 'IT', 103, 1400);
INSERT INTO departments VALUES (70, 'Public Relations', 204, 2700);
INSERT INTO departments VALUES (80, 'Sales', 145, 2500);
INSERT INTO departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO departments VALUES (100, 'Finance', 108, 1700);
INSERT INTO departments VALUES (110, 'Accounting', 205, 1700);
INSERT INTO departments VALUES (120, 'Treasury', NULL, 1700);
INSERT INTO departments VALUES (130, 'Corporate Tax', NULL, 1700);
INSERT INTO departments VALUES (140, 'Control And Credit', NULL, 1700);
INSERT INTO departments VALUES (150, 'Shareholder Services', NULL, 1700);
INSERT INTO departments VALUES (160, 'Benefits', NULL, 1700);
INSERT INTO departments VALUES (170, 'Manufacturing', NULL, 1700);
INSERT INTO departments VALUES (180, 'Construction', NULL, 1700);
INSERT INTO departments VALUES (190, 'Contracting', NULL, 1700);
INSERT INTO departments VALUES (200, 'Operations', NULL, 1700);
INSERT INTO departments VALUES (210, 'IT Support', NULL, 1700);
INSERT INTO departments VALUES (220, 'NOC', NULL, 1700);
INSERT INTO departments VALUES (230, 'IT Helpdesk', NULL, 1700);

-- Insert data into JOBS table
INSERT INTO jobs VALUES ('AD_PRES', 'President', 20000, 40000);
INSERT INTO jobs VALUES ('AD_VP', 'Administration Vice President', 15000, 30000);
INSERT INTO jobs VALUES ('AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO jobs VALUES ('FI_MGR', 'Finance Manager', 8200, 16000);
INSERT INTO jobs VALUES ('FI_ACCOUNT', 'Accountant', 4200, 9000);
INSERT INTO jobs VALUES ('AC_MGR', 'Accounting Manager', 8200, 16000);
INSERT INTO jobs VALUES ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
INSERT INTO jobs VALUES ('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO jobs VALUES ('SA_REP', 'Sales Representative', 6000, 12000);
INSERT INTO jobs VALUES ('ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO jobs VALUES ('ST_CLERK', 'Stock Clerk', 2000, 5000);
INSERT INTO jobs VALUES ('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO jobs VALUES ('MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO jobs VALUES ('MK_REP', 'Marketing Representative', 4000, 9000);
INSERT INTO jobs VALUES ('HR_REP', 'Human Resources Representative', 4000, 9000);
INSERT INTO jobs VALUES ('PR_REP', 'Public Relations Representative', 4500, 10500);

-- Insert data into EMPLOYEES table
INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('17-JUN-03', 'DD-MON-RR'), 'AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('21-SEP-05', 'DD-MON-RR'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', TO_DATE('13-JAN-01', 'DD-MON-RR'), 'AD_VP', 17000, NULL,
