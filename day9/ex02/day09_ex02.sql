
CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $fnc_trg_person_delete_audit$
BEGIN
 INSERT INTO person_audit (type_event, row_id, name, age, gender, address) VALUES ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        RETURN OLD;
    END;
$fnc_trg_person_delete_audit$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_delete_audit AFTER UPDATE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();
DELETE FROM person WHERE id = 10;