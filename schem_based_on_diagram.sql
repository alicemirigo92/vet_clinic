CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at timestamp NOT NULL,
    patient_id int NOT NULL,
    status varchar(50) NOT NULL
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL NOT NULL,
    generated_at timestamp NOT NULL,
    payed_at timestamp NOT NULL,
    medical_history_id int NOT NULL
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type varchar(50) NOT NULL,
    name varchar(50) NOT NULL
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL NOT NULL,
    quantity int NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id int NOT NULL,
    treatment_id int NOT NULL
);

ALTER TABLE invoice_items 
ADD FOREIGN KEY (invoice_id) REFERENCES invoices (id);

ALTER TABLE invoice_items 
ADD FOREIGN KEY (treatment_id) REFERENCES treatments (id);

ALTER TABLE invoices 
ADD FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id);

ALTER TABLE medical_histories 
ADD FOREIGN KEY (patient_id) REFERENCES patients (id);