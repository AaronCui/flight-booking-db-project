
-- AIRPLANES
INSERT INTO Airplane_1(model, business_cap)
VALUES('BOEING777', 20);

INSERT INTO Airplane_1(model, business_cap)
VALUES('AIRBUS320', 30);

INSERT INTO Airplane_1(model, business_cap)
VALUES('AIRBUS330', 24);

INSERT INTO Airplane_1(model, business_cap)
VALUES('AIRBUS350', 36);

INSERT INTO Airplane_1(model, business_cap)
VALUES('BOEING787', 24);

INSERT INTO Airplane_2(model, economy_cap)
VALUES('BOEING777', 300);

INSERT INTO Airplane_2(model, economy_cap)
VALUES('AIRBUS320', 168);

INSERT INTO Airplane_2(model, economy_cap)
VALUES('AIRBUS330', 269);

INSERT INTO Airplane_2(model, economy_cap)
VALUES('AIRBUS350', 322);

INSERT INTO Airplane_2(model, economy_cap)
VALUES('BOEING787', 250);

INSERT INTO Airplane_3(model, firstclass_cap)
VALUES('BOEING777', 8);

INSERT INTO Airplane_3(model, firstclass_cap)
VALUES('AIRBUS320', 0);

INSERT INTO Airplane_3(model, firstclass_cap)
VALUES('AIRBUS330', 0);

INSERT INTO Airplane_3(model, firstclass_cap)
VALUES('AIRBUS350', 12);

INSERT INTO Airplane_3(model, firstclass_cap)
VALUES('BOEING787', 0);

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES('1234', '520', 'AC', '2018-05-20', 'BOEING777');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES('1023', '092', 'CA', '2018-05-21', 'AIRBUS320');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES('5048', '084', 'JP', '2018-06-02', 'AIRBUS330');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES('9765', '022', 'AA', '2018-02-16', 'AIRBUS350');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES('2458', '554', 'CX', '2018-02-16', 'BOEING787');

-- AIRPORTS
INSERT INTO Airport_2(code, country, city, capacity)
VALUES('YVR', 'CA', 'Vancouver', 150);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('ATL', 'US', 'Georgia', 120);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('CDG', 'FR', 'Paris', 80);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('HND', 'JP', 'Tokyo', 120);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('PEK', 'CN', 'Beijing', 150);

-- CUSTOMERS
INSERT INTO Customer (email, phone_no, freq_flyer_miles)
VALUES('j.bean@gm.com', '604-999-2222', 2000);

INSERT INTO Customer (email, phone_no, freq_flyer_miles)
VALUES('aaroniscool@wut.com', '778-123-1234', 0);

INSERT INTO Customer (email, phone_no, freq_flyer_miles)
VALUES('kevinSmart@ubc.com', '555-555-5555', 5000);

INSERT INTO Customer (email, phone_no, freq_flyer_miles)
VALUES('handsomeBrian@smooth.com', '123-456-7890', 1500);

INSERT INTO Customer (email, phone_no, freq_flyer_miles)
VALUES('bestAngela@lol.com', '444-444-4444', 100);

-- STAFF
INSERT INTO Staff (email, sin, name, level)
VALUES ('Users1@airplaneUsers.com', 111222333, 'Jane', 1);

INSERT INTO Staff (email, sin, name, level)
VALUES ('Users2@airplaneUsers.com', 222111333, 'John', 2);

INSERT INTO Staff (email, sin, name, level)
VALUES ('jimHardworker3@airplaneUsers.com', 333222111, 'Jim', 3);

INSERT INTO Staff (email, sin, name, level)
VALUES ('kevin1@airplaneUsers.com', 123456789, 'Kevin', 1);

INSERT INTO Staff (email, sin, name, level)
VALUES ('smithLazy@airplaneUsers.com', 987654321, 'Smith', 2);


