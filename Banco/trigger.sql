use opportunity;

drop trigger log_valores;

DELIMITER $$
CREATE TRIGGER log_valores
 BEFORE UPDATE ON projetos
 FOR EACH ROW
BEGIN
IF NEW.turnoverforowner<> OLD.turnoverforowner OR 
NEW.gmforowner<> OLD.gmforowner THEN
INSERT INTO valoreslog(pvturnoverforowner, pvgmforowner,dataupdate,emailuser,projectid) 
values (OLD.turnoverforowner,OLD.gmforowner, NOW(),NEW.emailuser,OLD.projectid);
END IF;
 END$$
DELIMITER ;