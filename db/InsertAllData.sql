
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

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('SFO', 'US', 'San Francisco', 300);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('LAX', 'US', 'Los Angeles', 1000);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('NRT', 'JP', 'Narita', 300);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('JFK', 'US', 'New York City', 900);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('HNL', 'US', 'Honolulu', 300);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('SIN', 'SG', 'Changi', 450);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('HKG', 'HK', 'Hong Kong', 800);

INSERT INTO Airport_2(code, country, city, capacity)
VALUES('YYZ', 'CA', 'Toronto', 700);

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

-- LANDSAT_TAKESOFF_FLIGHT
INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, plane_id, landsAt_airport, takesOff_airport)
VALUES ('520', 'AC', '2018-05-20', 1234, 'YVR', 'SFO');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, plane_id, landsAt_airport, takesOff_airport)
VALUES ('099', 'UA', '2018-05-21', 9000, 'SFO', 'YYZ');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, plane_id, landsAt_airport, takesOff_airport)
VALUES ('100', 'DL', '2018-05-26', 9001, 'YVR', 'YYZ');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, plane_id, landsAt_airport, takesOff_airport)
VALUES ('092', 'CA', '2018-05-21', 1023, 'SFO', 'YVR');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, plane_id, landsAt_airport, takesOff_airport)
VALUES ('084', 'JP', '2018-06-02', 5048, 'LAX', 'NRT');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, plane_id, landsAt_airport, takesOff_airport)
VALUES ('022', 'AA', '2018-02-16', 9765, 'HNL', 'JFK');

INSERT INTO LandsAt_TakesOff_Flight (flight_no, airline, date, plane_id, landsAt_airport, takesOff_airport)
VALUES ('554', 'CX', '2018-02-16', 2458, 'SIN', 'HKG');

-- HAS_SEATS TABLES
INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A01', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('A02', 'first');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('D19', 'business');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('J10', 'economy');

INSERT INTO Has_Seats_1 (seat_no, seat_class)
VALUES ('J11', 'economy');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A01', 'window');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('A02', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('D19', 'aisle');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('J10', 'row');

INSERT INTO Has_Seats_2 (seat_no, seat_type)
VALUES('J11', 'exit');

INSERT INTO Has_Seats_3 (seat_class, seat_price)
VALUES('first', 2500);

INSERT INTO Has_Seats_3 (seat_class, seat_price)
VALUES('business', 2000);

INSERT INTO Has_Seats_3 (seat_class, seat_price)
VALUES('premium', 1500);

INSERT INTO Has_Seats_3 (seat_class, seat_price)
VALUES('economy', 1000);

INSERT INTO Has_Seats_3 (seat_class, seat_price)
VALUES('luxury', 10000);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved) 
VALUES ('A01','092', 'CA', '2018-05-21', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved) 
VALUES ('A02','092', 'CA', '2018-05-21', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved) 
VALUES ('D19','084', 'JP', '2018-06-02', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved) 
VALUES ('J10','022', 'AA', '2018-02-16', 1);

INSERT INTO Has_Seats_4 (seat_no, flight_no, airline, date, reserved) 
VALUES ('J11','022', 'AA', '2018-02-16', 1);

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

