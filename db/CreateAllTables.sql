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
  flight_no	CHAR(5),
  airline		CHAR(5),
  date		  DATE,
  model		  CHAR(20),
  PRIMARY KEY (flight_no, airline, date)
);

CREATE TABLE Airport (
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
  landsAt_airport	  CHAR(5),
  takesOff_airport	CHAR(5),
  PRIMARY KEY (flight_no, airline, date),
  FOREIGN KEY (flight_no, airline, date)
    REFERENCES Airplane_4 (flight_no, airline, date),
  FOREIGN KEY (landsAt_airport)
    REFERENCES Airport (code),
  FOREIGN KEY (takesOff_airport)
    REFERENCES Airport (code)
);

CREATE TABLE Has_Seats_3 (
  seat_class  CHAR(20),
  flight_no	  CHAR(5),
  airline		  CHAR(5),
  date		    DATE,
  seat_price	INTEGER,  -- Smallest at cent
  PRIMARY KEY (seat_class, flight_no, airline, date),
  FOREIGN KEY (flight_no, airline, date)
    REFERENCES LandsAt_TakesOff_Flight (flight_no, airline, date)
      ON DELETE CASCADE
      ON UPDATE CASCADE
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


CREATE TABLE Users(
  email         VARCHAR(50) UNIQUE NOT NULL,
  password      TEXT NOT NULL,
  first_name    CHAR(20) NOT NULL,
  last_name     CHAR(20) NOT NULL,
  access_level  INTEGER,
  PRIMARY KEY   (email),
  CHECK         (access_level >= 0 AND access_level <= 2)
);

CREATE TABLE Customer (
  email             CHAR(50) UNIQUE NOT NULL,
  phone_no          CHAR(20) UNIQUE,
  freq_flyer_miles 	INTEGER,
  PRIMARY KEY (email),
  FOREIGN KEY (email)
    REFERENCES Users(email)
	ON DELETE CASCADE
);


CREATE TABLE Staff (
  email     CHAR(50) UNIQUE NOT NULL,
  sin       INTEGER UNIQUE NOT NULL,
  level     INTEGER,
  PRIMARY KEY (email),
  FOREIGN KEY (email)
    REFERENCES Users(email)
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
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Promotion_Item (
	promotion_id CHAR(5),
	promotion_item CHAR(20),
	PRIMARY KEY (promotion_id)
);

CREATE TABLE Reserves_Promotion_Item (
	reservation_id CHAR(20),
	promotion_id CHAR(20),
	PRIMARY KEY (reservation_id, promotion_id),
	FOREIGN KEY (reservation_id)
		REFERENCES Reserves_Occupies_Reservation (reservation_id),
	FOREIGN KEY (promotion_id)
		REFERENCES Promotion_Item
);