/*
  DROP ALL TABLES

  Orders are changed such that there's no referenced tables to be deleted causing error
  Execute the entire file should work.

 */

/*
  NOTE: Try this first for dropping all tables on conventional postgres setup
  public is the default schema in a database which holds all tables
 */

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

/*
  Otherwise, try to see which tables to delete, if unable due to references
  try executing in order to the point of necessity
 */

-- Non core tables
DROP TABLE IF EXISTS Reserves_Promotion_Item;

DROP TABLE IF EXISTS Promotion_Item;

DROP TABLE IF EXISTS Staff;

-- References are mostly the top 5 tables here
DROP TABLE IF EXISTS Reserves_Occupies_Reservation;

DROP TABLE IF EXISTS Customer;

DROP TABLE IF EXISTS Users;

DROP TABLE IF EXISTS Has_Seats_4;

DROP TABLE IF EXISTS LandsAt_TakesOff_Flight;

DROP TABLE IF EXISTS Airport;

DROP TABLE IF EXISTS Airplane_4;

DROP TABLE IF EXISTS Airplane_3;

DROP TABLE IF EXISTS Airplane_2;

DROP TABLE IF EXISTS Airplane_1;

DROP TABLE IF EXISTS Has_Seats_3;

DROP TABLE IF EXISTS Has_Seats_2;

DROP TABLE IF EXISTS Has_Seats_1;
