CREATE TABLE "Clients" (
    id         SERIAL PRIMARY KEY,
    surname    VARCHAR(35) NOT NULL CHECK (length(surname) > 0),
    name       VARCHAR(35) NOT NULL CHECK (length(name)    > 0),
    fathername VARCHAR(35),
    experience SMALLINT             CHECK (experience >= 0 AND experience <= 100)
);