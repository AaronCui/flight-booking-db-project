
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
VALUES(1234, '520', 'AC', '2018-05-20', 'BOEING777');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(1234, '521', 'AC', '2018-05-21', 'BOEING777');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(1234, '522', 'AC', '2018-05-22', 'BOEING777');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(9000, '099', 'UA', '2018-05-21', 'BOEING787');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(1023, '092', 'CA', '2018-05-21', 'AIRBUS320');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(5048, '084', 'JP', '2018-06-02', 'AIRBUS330');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(9765, '022', 'AA', '2018-02-16', 'AIRBUS350');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(2458, '554', 'CX', '2018-02-16', 'BOEING787');

INSERT INTO Airplane_4(plane_id, flight_no, airline, date, model)
VALUES(9001, '100', 'DL', '2018-05-26', 'AIRBUS350');

-- AIRPORTS
INSERT INTO Airport(code, country, city, capacity)
VALUES('YVR', 'CA', 'Vancouver', 150);

INSERT INTO Airport(code, country, city, capacity)
VALUES('ATL', 'US', 'Georgia', 120);

INSERT INTO Airport(code, country, city, capacity)
VALUES('CDG', 'FR', 'Paris', 80);

INSERT INTO Airport(code, country, city, capacity)
VALUES('HND', 'JP', 'Tokyo', 120);

INSERT INTO Airport(code, country, city, capacity)
VALUES('PEK', 'CN', 'Beijing', 150);

INSERT INTO Airport(code, country, city, capacity)
VALUES('SFO', 'US', 'San Francisco', 300);

INSERT INTO Airport(code, country, city, capacity)
VALUES('LAX', 'US', 'Los Angeles', 1000);

INSERT INTO Airport(code, country, city, capacity)
VALUES('NRT', 'JP', 'Narita', 300);

INSERT INTO Airport(code, country, city, capacity)
VALUES('JFK', 'US', 'New York City', 900);

INSERT INTO Airport(code, country, city, capacity)
VALUES('HNL', 'US', 'Honolulu', 300);

INSERT INTO Airport(code, country, city, capacity)
VALUES('SIN', 'SG', 'Changi', 450);

INSERT INTO Airport(code, country, city, capacity)
VALUES('HKG', 'HK', 'Hong Kong', 800);

INSERT INTO Airport(code, country, city, capacity)
VALUES('YYZ', 'CA', 'Toronto', 700);

-- USERS
INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES('j.bean@gm.com', 'password', 'John', 'Bean', 0);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES('aaroniscool@wut.com', 'hunter123', 'Aaron', 'Cui', 0);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES('kevinSmart@ubc.com', '1234', 'Kevin', 'Chan', 0);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES('handsomeBrian@smooth.com', 'sup', 'Brian', 'Chen', 0);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES('bestAngela@lol.com', 'angela', 'Angela', 'Cho', 0);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES ('Users1@airplaneUsers.com', 'admin', 'Jane', 'Janes', 1);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES ('Users2@airplaneUsers.com', 'admin', 'John', 'Wick', 1);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES ('Hardworker3@airplaneUsers.com', 'admin', 'LeBron', 'James', 1);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES ('kevin1@airplaneUsers.com', 'admin', 'Kevin', 'Love', 1);

INSERT INTO Users (email, password, first_name, last_name, access_level)
VALUES ('smithLazy@airplaneUsers.com', 'admin', 'Adam', 'Smith', 1);

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
INSERT INTO Staff (email, sin, level)
VALUES ('Users1@airplaneUsers.com', 111222333, 1);

INSERT INTO Staff (email, sin, level)
VALUES ('Users2@airplaneUsers.com', 222111333, 2);

INSERT INTO Staff (email, sin, level)
VALUES ('Hardworker3@airplaneUsers.com', 333222111, 3);

INSERT INTO Staff (email, sin, level)
VALUES ('kevin1@airplaneUsers.com', 123456789, 1);

INSERT INTO Staff (email, sin, level)
VALUES ('smithLazy@airplaneUsers.com', 987654321, 2);

-- LANDSAT_TAKESOFF_FLIGHT
INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('520', 'AC', '2018-05-20', 'YVR', 'SFO');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('521', 'AC', '2018-05-21', 'SFO', 'YVR');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('522', 'AC', '2018-05-22', 'YVR', 'SFO');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('099', 'UA', '2018-05-21', 'SFO', 'YYZ');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('100', 'DL', '2018-05-26', 'YVR', 'YYZ');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('092', 'CA', '2018-05-21', 'SFO', 'YVR');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('084', 'JP', '2018-06-02', 'LAX', 'NRT');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('022', 'AA', '2018-02-16', 'HNL', 'JFK');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, landsAt_airport, takesOff_airport)
VALUES ('554', 'CX', '2018-02-16', 'SIN', 'HKG');

-- HAS_SEATS TABLES
INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A01', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A02', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A03', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A04', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A05', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A06', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A07', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('B09', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('B14', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('C02', 'business');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('C11', 'business');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('D06', 'business');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('D19', 'business');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('E12', 'business');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('H07', 'economy');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('J01', 'economy');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('J10', 'economy');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('J11', 'economy');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('K10', 'economy');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('L01', 'economy');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A01', 'window');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A02', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A03', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A04', 'window');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A05', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A06', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('A07', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('B09', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('B14', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('C02', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('C11', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('D06', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('D19', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('E12', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('H07', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('J01', 'window');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('J10', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('J11', 'exit');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('K10', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES ('L01', 'window');

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '520', 'AC', '2018-05-20', 100000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '520', 'AC', '2018-05-20', 50000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '520', 'AC', '2018-05-20', 25000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '521', 'AC', '2018-05-21', 90000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '521', 'AC', '2018-05-21', 40000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '521', 'AC', '2018-05-21', 20000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '522', 'AC', '2018-05-22', 110000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '522', 'AC', '2018-05-22', 60000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '522', 'AC', '2018-05-22', 35000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '099', 'UA', '2018-05-21', 200000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '099', 'UA', '2018-05-21', 150000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '099', 'UA', '2018-05-21', 100000);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '092', 'CA', '2018-05-21', 999999);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '092', 'CA', '2018-05-21', 777777);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '092', 'CA', '2018-05-21', 555555);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '084', 'JP', '2018-06-02', 654321);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '084', 'JP', '2018-06-02', 543219);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '084', 'JP', '2018-06-02', 432198);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '022', 'AA', '2018-02-16', 3322111);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '022', 'AA', '2018-02-16', 221100);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '022', 'AA', '2018-02-16', 112200);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '554', 'CX', '2018-02-16', 969696);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '554', 'CX', '2018-02-16', 696969);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '554', 'CX', '2018-02-16', 111111);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('first', '100', 'DL', '2018-05-26', 433333);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('business', '100', 'DL', '2018-05-26', 333333);

INSERT INTO Has_Seats_3 (seat_class, flight_no, airline, date, seat_price)
VALUES('economy', '100', 'DL', '2018-05-26', 222222);

-- 520 AC 2018-05-20
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('H07','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','520', 'AC', '2018-05-20', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','520', 'AC', '2018-05-20', 0);

-- 521 AC 2018-05-21
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('H07','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','521', 'AC', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','521', 'AC', '2018-05-21', 0);

-- 522 AC 2018-05-22
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('H07','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','522', 'AC', '2018-05-22', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','522', 'AC', '2018-05-22', 0);

-- 099 UA 2018-05-21
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('H07','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','099', 'UA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','099', 'UA', '2018-05-21', 0);

-- 100 DL 2018-05-26
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('H07','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','100', 'DL', '2018-05-26', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','100', 'DL', '2018-05-26', 0);

-- 092 CA 2018-05-21
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','092', 'CA', '2018-05-21', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','092', 'CA', '2018-05-21', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('H07','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','092', 'CA', '2018-05-21', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','092', 'CA', '2018-05-21', 0);

-- 084 JP 2018-06-02
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','084', 'JP', '2018-06-02', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D07','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','084', 'JP', '2018-06-02', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','084', 'JP', '2018-06-02', 0);

-- 022 AA 2018-02-16
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D07','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','022', 'AA', '2018-02-16', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','022', 'AA', '2018-02-16', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','022', 'AA', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','022', 'AA', '2018-02-16', 0);

-- 554 CX 2018-02-16
INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A01','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A02','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A03','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A04','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A05','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A06','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('A07','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B09','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('B14','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C02','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('C11','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D06','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D19','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('E12','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('D07','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J01','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J10','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('J11','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('K10','554', 'CX', '2018-02-16', 0);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved)
VALUES ('L01','554', 'CX', '2018-02-16', 0);

-- RESERVES_OCCUPIES_RESERVATION
INSERT INTO Reserves_Occupies_Reservation (reservation_id, email, seat_no, flight_no, airline, date, luggages, meal_pref)
VALUES('123456', 'aaroniscool@wut.com', 'A01', '092', 'CA', '2018-05-21', 2, 0);

INSERT INTO Reserves_Occupies_Reservation (reservation_id, email, seat_no, flight_no, airline, date, luggages, meal_pref)
VALUES('123457', 'kevinSmart@ubc.com', 'A02', '092', 'CA', '2018-05-21', 1, 1);

INSERT INTO Reserves_Occupies_Reservation (reservation_id, email, seat_no, flight_no, airline, date, luggages, meal_pref)
VALUES('123458', 'handsomeBrian@smooth.com', 'D19', '084', 'JP', '2018-06-02', 0, 0);

INSERT INTO Reserves_Occupies_Reservation (reservation_id, email, seat_no, flight_no, airline, date, luggages, meal_pref)
VALUES('123459', 'bestAngela@lol.com', 'J10', '022', 'AA', '2018-02-16', 2, 0);

INSERT INTO Reserves_Occupies_Reservation (reservation_id, email, seat_no, flight_no, airline, date, luggages, meal_pref)
VALUES('123455', 'j.bean@gm.com', 'J11', '022', 'AA', '2018-02-16', 2, 2);

-- PROMOTION_ITEM
INSERT INTO Promotion_Item (promotion_id, promotion_item)
VALUES('ABX22', 'Headphones');

INSERT INTO Promotion_Item (promotion_id, promotion_item)
VALUES('BBB45', 'Backpack');

INSERT INTO Promotion_Item (promotion_id, promotion_item)
VALUES('CML16', 'iPad Pro');

INSERT INTO Promotion_Item (promotion_id, promotion_item)
VALUES('YKK49', 'Flatscreen TV');

INSERT INTO Promotion_Item (promotion_id, promotion_item)
VALUES('UJN11', 'Adidas Yeezy Boosts');

-- RESERVES_PROMOTION_ITEM
INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123456', 'ABX22');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123456', 'CML16');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123456', 'BBB45');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123456', 'YKK49');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123457', 'ABX22');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123457', 'BBB45');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123457', 'CML16');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123457', 'YKK49');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123457', 'UJN11');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123458', 'ABX22');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123459', 'ABX22');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123455', 'YKK49');

INSERT INTO Reserves_Promotion_Item (reservation_id, promotion_id)
VALUES('123455', 'UJN11');
