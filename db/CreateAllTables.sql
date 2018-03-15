/*
  TABLE CREATION

  Orders are changed such that there's no reference to not yet created tables
  Execute the entire file should work.
 */

CREATE TABLE Has_Seats_1 (
  seat_no     CHAR(5),
  seat_class  CHAR(20),
  PRIMARY KEY (seat_no)
);

CREATE TABLE Has_Seats_2 (
  seat_no	    CHAR(5),
  seat_type	  CHAR(20),
  PRIMARY KEY (seat_no)
);

CREATE TABLE Has_Seats_3 (
  seat_class	CHAR(5),
  seat_price	INTEGER,  -- Smallest at cent
  PRIMARY KEY (seat_class)
);


CREATE TABLE Airplane_1 (
  model		      CHAR(20),
  business_cap  INTEGER,
  PRIMARY KEY (model)
);

CREATE TABLE Airplane_2 (
  model		    CHAR(20),
  economy_cap	INTEGER,
  PRIMARY KEY (model)
);

CREATE TABLE Airplane_3 (
  model		        CHAR(20),
  firstclass_cap	INTEGER,
  PRIMARY KEY     (model)
);

CREATE TABLE Airplane_4 (
  plane_id	INTEGER,
  flght_no	CHAR(5),
  airline		CHAR(5),
  date		  DATE,
  model		  CHAR(20),
  PRIMARY KEY (plane_id)
);


CREATE TABLE Airport_1 (
  country	  CHAR(2),	 -- ISO Alpha-2 Country code
  language	CHAR(20),
  PRIMARY KEY (country)
);

CREATE TABLE Airport_2 (
  code		  CHAR(5),
  country	  CHAR(2), 	-- ISO Alpha-2 Country code
  city		  CHAR(20),
  capacity	INTEGER,
  PRIMARY KEY (code)
);


CREATE TABLE LandsAt_TakesOff_Flight (
  flight_no	        CHAR(5),
  airline		        CHAR(5),
  date		          DATE,
  plane_id	        INTEGER,
  landsAt_airport	  CHAR(5),
  takesOff_airport	CHAR(5),
  PRIMARY KEY (flight_no, airline, date),
  FOREIGN KEY (plane_id)
    REFERENCES Airplane_4 (plane_id),
  FOREIGN KEY (landsAt_airport)
    REFERENCES Airport_2 (code),
  FOREIGN KEY (takesOff_airport)
    REFERENCES Airport_2 (code)
);


CREATE TABLE Has_Seats_4 (
  seat_no   CHAR(5),
  flight_no CHAR(5),
  airline   CHAR(2),
  date      DATE,
  reserved  INTEGER,	-- Boolean Logic
  PRIMARY KEY (seat_no, flight_no, airline, date),
  FOREIGN KEY (flight_no, airline, date)
    REFERENCES LandsAt_TakesOff_Flight (flight_no, airline, date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


CREATE TABLE Customer (
  email			        CHAR(50),
  freq_flyer_miles 	INTEGER,
  PRIMARY KEY (email)
);


CREATE TABLE Staff (
  email		CHAR(50),
  sin     INTEGER,
  name    CHAR(20),
  level   INTEGER,
  PRIMARY KEY (email)
);


CREATE TABLE Reserves_Occupies_Reservation (
  reservation_id  CHAR(20),
  email           CHAR(50),
  seat_no         CHAR(5),
  flight_no       CHAR(5),
  airline         CHAR(5),
  date            DATE,
  luggages        INTEGER,
  meal_pref       INTEGER,
  PRIMARY KEY (reservation_id),
  FOREIGN KEY (seat_no, flight_no, airline, date)
    REFERENCES HAS_SEATS_4 (seat_no, flight_no, airline, date)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY (email)
    REFERENCES Customer
      ON DELETE SET NULL
      ON UPDATE CASCADE
);
