CREATE TABLE "Rent" (
    client_id INTEGER NOT NULL,
    auto_id   INTEGER NOT NULL,
    price     DECIMAL NOT NULL CHECK ( price > 0 ),

    FOREIGN KEY (client_id) REFERENCES "Clients",
    FOREIGN KEY (auto_id)   REFERENCES "Autos"
);