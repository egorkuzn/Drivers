CREATE TABLE "Autos" (
    id    SERIAL PRIMARY KEY,
    model TEXT       NOT NULL,
    year  SMALLINT   NOT NULL CHECK (year <= DATE_PART('year', CURRENT_DATE) AND year >= 1930)
);