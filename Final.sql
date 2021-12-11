-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-10 22:14:17.138

-- tables
-- Table: dim_crime_t
CREATE TABLE dim_crime_t (
    DC_Key varchar(255)  NOT NULL,
    Crime varchar(255)  NOT NULL,
    CONSTRAINT dim_crime_t_pk PRIMARY KEY (DC_Key)
);

-- Table: dim_crime_timing
CREATE TABLE dim_crime_timing (
    Hour int  NOT NULL,
    Dispatch_Time varchar(255)  NOT NULL,
    Dispatch_Date varchar(255)  NOT NULL,
    Dispatch_Date_Time varchar(255)  NOT NULL,
    Month varchar(255)  NOT NULL,
    CONSTRAINT dim_crime_timing_pk PRIMARY KEY (Hour)
);

-- Table: dim_location
CREATE TABLE dim_location (
    id int  NOT NULL,
    Block varchar(255)  NOT NULL,
    Lon decimal  NOT NULL,
    Lat decimal  NOT NULL,
    CONSTRAINT dim_location_pk PRIMARY KEY (id)
);

-- Table: dim_police
CREATE TABLE dim_police (
    DC_District int  NOT NULL,
    Police_District int  NOT NULL,
    UCR_General int  NOT NULL,
    CONSTRAINT dim_police_pk PRIMARY KEY (DC_District)
);

-- Table: fact_crime
CREATE TABLE fact_crime (
    Crime_ID int  NOT NULL,
    DC_Key varchar(255)  NOT NULL,
    dim_location_id int  NOT NULL,
    dim_crime_timing_Hour int  NOT NULL,
    dim_police_DC_District int  NOT NULL,
    Crime varchar(255)  NOT NULL,
    CONSTRAINT fact_crime_pk PRIMARY KEY (Crime_ID)
);

-- foreign keys
-- Reference: fact_crime_dim_crime_t (table: fact_crime)
ALTER TABLE fact_crime ADD CONSTRAINT fact_crime_dim_crime_t
    FOREIGN KEY (DC_Key)
    REFERENCES dim_crime_t (DC_Key)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_crime_dim_crime_timing (table: fact_crime)
ALTER TABLE fact_crime ADD CONSTRAINT fact_crime_dim_crime_timing
    FOREIGN KEY (dim_crime_timing_Hour)
    REFERENCES dim_crime_timing (Hour)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_crime_dim_location (table: fact_crime)
ALTER TABLE fact_crime ADD CONSTRAINT fact_crime_dim_location
    FOREIGN KEY (dim_location_id)
    REFERENCES dim_location (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_crime_dim_police (table: fact_crime)
ALTER TABLE fact_crime ADD CONSTRAINT fact_crime_dim_police
    FOREIGN KEY (dim_police_DC_District)
    REFERENCES dim_police (DC_District)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

