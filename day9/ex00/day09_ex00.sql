CREATE TABLE person_audit
(
    created timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event char(1) NOT NULL DEFAULT 'I' constraint ch_type_event check ( type_event IN ('I', 'D', 'U')),
	row_id bigint NOT NULL,
	name varchar,
	age integer,
	gender varchar,
	address varchar
	
);
CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $fnc_trg_person_insert_audit$
BEGIN
INSERT INTO person_audit (row_id, name, age, gender, address) VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        RETURN NEW;
    END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
	
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');