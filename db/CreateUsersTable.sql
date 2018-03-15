DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
  email     VARCHAR(50) UNIQUE NOT NULL,
  password  TEXT NOT NULL,
  isActive  BOOLEAN NOT NULL DEFAULT TRUE,
  role      INTEGER,
  PRIMARY KEY (email)
);

INSERT INTO Users (EMAIL, PASSWORD, ROLE) VALUES ('test@yolo.com', 'test', 0);
INSERT INTO Users (EMAIL, PASSWORD, ROLE) VALUES ('hey@hey.com', 'yo', 0);
INSERT INTO Users (EMAIL, PASSWORD, ROLE) VALUES ('admin@company.com', 'admin123', 2);