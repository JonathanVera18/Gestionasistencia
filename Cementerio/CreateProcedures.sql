-- Procedimiento almacenado para insertar en la entidad CANTON
BEGIN;
CREATE OR REPLACE PROCEDURE insert_canton(p_id_can INT, p_name_can TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO canton (id_can, name_can) VALUES (p_id_can, p_name_can);
END; $$;
COMMIT;

-- Procedimiento almacenado para seleccionar de la entidad CANTON
BEGIN;
CREATE OR REPLACE PROCEDURE select_canton(p_id_can INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM canton WHERE id_can = p_id_can;
    RAISE NOTICE 'id_can: %, name_can: %', rec.id_can, rec.name_can;
END; $$;
COMMIT;

-- Procedimiento almacenado para actualizar la entidad CANTON
BEGIN;
CREATE OR REPLACE PROCEDURE update_canton(p_id_can INT, p_name_can TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE canton SET name_can = p_name_can WHERE id_can = p_id_can;
END; $$;
COMMIT;

-- Procedimiento almacenado para eliminar de la entidad CANTON
BEGIN;
CREATE OR REPLACE PROCEDURE delete_canton(p_id_can INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM canton WHERE id_can = p_id_can;
END; $$;
COMMIT;


-- Procedimiento almacenado para insertar en la entidad CAUSA_MUERTE
CREATE OR REPLACE PROCEDURE insert_causa_muerte(p_id_cau_mue INT, p_name_cau_mue TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO causa_muerte (id_cau_mue, name_cau_mue) VALUES (p_id_cau_mue, p_name_cau_mue);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad CAUSA_MUERTE
CREATE OR REPLACE PROCEDURE select_causa_muerte(p_id_cau_mue INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM causa_muerte WHERE id_cau_mue = p_id_cau_mue;
    RAISE NOTICE 'id_cau_mue: %, name_cau_mue: %', rec.id_cau_mue, rec.name_cau_mue;
END; $$;
-- Procedimiento almacenado para actualizar la entidad CAUSA_MUERTE
CREATE OR REPLACE PROCEDURE update_causa_muerte(p_id_cau_mue INT, p_name_cau_mue TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE causa_muerte SET name_cau_mue = p_name_cau_mue WHERE id_cau_mue = p_id_cau_mue;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad CAUSA_MUERTE
CREATE OR REPLACE PROCEDURE delete_causa_muerte(p_id_cau_mue INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM causa_muerte WHERE id_cau_mue = p_id_cau_mue;
END; $$;


-- Procedimiento almacenado para insertar en la entidad CERTIFICADO
CREATE OR REPLACE PROCEDURE insert_certificado(p_id_certi INT, p_id_tram INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO certificado (id_certi, id_tram) VALUES (p_id_certi, p_id_tram);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad CERTIFICADO
CREATE OR REPLACE PROCEDURE select_certificado(p_id_certi INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM certificado WHERE id_certi = p_id_certi;
    RAISE NOTICE 'id_certi: %, id_tram: %', rec.id_certi, rec.id_tram;
END; $$;
-- Procedimiento almacenado para actualizar la entidad CERTIFICADO
CREATE OR REPLACE PROCEDURE update_certificado(p_id_certi INT, p_id_tram INT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE certificado SET id_tram = p_id_tram WHERE id_certi = p_id_certi;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad CERTIFICADO
CREATE OR REPLACE PROCEDURE delete_certificado(p_id_certi INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM certificado WHERE id_certi = p_id_certi;
END; $$;

-- Procedimiento almacenado para insertar en la entidad CLIENTE
CREATE OR REPLACE PROCEDURE insert_cliente(p_id_clien INT, p_id_ubi INT, p_ci_clien VARCHAR(10), p_name_clien TEXT, p_lname_clien TEXT, p_fch_naci_clien DATE, p_tel1_clien VARCHAR(10), p_tel2_clien VARCHAR(10))
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO cliente (id_clien, id_ubi, ci_clien, name_clien, lname_clien, fch_naci_clien, tel1_clien, tel2_clien) VALUES (p_id_clien, p_id_ubi, p_ci_clien, p_name_clien, p_lname_clien, p_fch_naci_clien, p_tel1_clien, p_tel2_clien);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad CLIENTE
CREATE OR REPLACE PROCEDURE select_cliente(p_id_clien INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM cliente WHERE id_clien = p_id_clien;
    RAISE NOTICE 'id_clien: %, id_ubi: %, ci_clien: %, name_clien: %, lname_clien: %, fch_naci_clien: %, tel1_clien: %, tel2_clien: %', rec.id_clien, rec.id_ubi, rec.ci_clien, rec.name_clien, rec.lname_clien, rec.fch_naci_clien, rec.tel1_clien, rec.tel2_clien;
END; $$;
-- Procedimiento almacenado para actualizar la entidad CLIENTE
CREATE OR REPLACE PROCEDURE update_cliente(p_id_clien INT, p_id_ubi INT, p_ci_clien VARCHAR(10), p_name_clien TEXT, p_lname_clien TEXT, p_fch_naci_clien DATE, p_tel1_clien VARCHAR(10), p_tel2_clien VARCHAR(10))
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE cliente SET id_ubi = p_id_ubi, ci_clien = p_ci_clien, name_clien = p_name_clien, lname_clien = p_lname_clien, fch_naci_clien = p_fch_naci_clien, tel1_clien = p_tel1_clien, tel2_clien = p_tel2_clien WHERE id_clien = p_id_clien;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad CLIENTE
CREATE OR REPLACE PROCEDURE delete_cliente(p_id_clien INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM cliente WHERE id_clien = p_id_clien;
END; $$;


-- Procedimiento almacenado para insertar en la entidad DIFUNTO
CREATE OR REPLACE PROCEDURE insert_difunto(p_id_difu INT, p_id_cau_mue INT, p_name_difu TEXT, p_lastn_difu TEXT, p_fch_naci_difu DATE, p_fch_muerte_difu DATE, p_code_acta_difu VARCHAR(5))
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO difunto (id_difu, id_cau_mue, name_difu, lastn_difu, fch_naci_difu, fch_muerte_difu, code_acta_difu) VALUES (p_id_difu, p_id_cau_mue, p_name_difu, p_lastn_difu, p_fch_naci_difu, p_fch_muerte_difu, p_code_acta_difu);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad DIFUNTO
CREATE OR REPLACE PROCEDURE select_difunto(p_id_difu INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM difunto WHERE id_difu = p_id_difu;
    RAISE NOTICE 'id_difu: %, id_cau_mue: %, name_difu: %, lastn_difu: %, fch_naci_difu: %, fch_muerte_difu: %, code_acta_difu: %', rec.id_difu, rec.id_cau_mue, rec.name_difu, rec.lastn_difu, rec.fch_naci_difu, rec.fch_muerte_difu, rec.code_acta_difu;
END; $$;
-- Procedimiento almacenado para actualizar la entidad DIFUNTO
CREATE OR REPLACE PROCEDURE update_difunto(p_id_difu INT, p_id_cau_mue INT, p_name_difu TEXT, p_lastn_difu TEXT, p_fch_naci_difu DATE, p_fch_muerte_difu DATE, p_code_acta_difu VARCHAR(5))
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE difunto SET id_cau_mue = p_id_cau_mue, name_difu = p_name_difu, lastn_difu = p_lastn_difu, fch_naci_difu = p_fch_naci_difu, fch_muerte_difu = p_fch_muerte_difu, code_acta_difu = p_code_acta_difu WHERE id_difu = p_id_difu;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad DIFUNTO
CREATE OR REPLACE PROCEDURE delete_difunto(p_id_difu INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM difunto WHERE id_difu = p_id_difu;
END; $$;


-- Procedimiento almacenado para insertar en la entidad ESTADO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE insert_estado_estructura(p_id_est_estruc INT, p_name_est_estruc TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO estado_estructura (id_est_estruc, name_est_estruc) VALUES (p_id_est_estruc, p_name_est_estruc);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad ESTADO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE select_estado_estructura(p_id_est_estruc INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM estado_estructura WHERE id_est_estruc = p_id_est_estruc;
    RAISE NOTICE 'id_est_estruc: %, name_est_estruc: %', rec.id_est_estruc, rec.name_est_estruc;
END; $$;
-- Procedimiento almacenado para actualizar la entidad ESTADO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE update_estado_estructura(p_id_est_estruc INT, p_name_est_estruc TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE estado_estructura SET name_est_estruc = p_name_est_estruc WHERE id_est_estruc = p_id_est_estruc;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad ESTADO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE delete_estado_estructura(p_id_est_estruc INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM estado_estructura WHERE id_est_estruc = p_id_est_estruc;
END; $$;




-- Procedimiento almacenado para insertar en la entidad ESTRUCTURA
CREATE OR REPLACE PROCEDURE insert_estructura(p_id_estruc INT, p_id_lugar_estruc INT, p_id_tipo_estruc INT, p_id_est_estruc INT, p_cruces BOOL)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO estructura (id_estruc, id_lugar_estruc, id_tipo_estruc, id_est_estruc, cruces) VALUES (p_id_estruc, p_id_lugar_estruc, p_id_tipo_estruc, p_id_est_estruc, p_cruces);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad ESTRUCTURA
CREATE OR REPLACE PROCEDURE select_estructura(p_id_estruc INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM estructura WHERE id_estruc = p_id_estruc;
    RAISE NOTICE 'id_estruc: %, id_lugar_estruc: %, id_tipo_estruc: %, id_est_estruc: %, cruces: %', rec.id_estruc, rec.id_lugar_estruc, rec.id_tipo_estruc, rec.id_est_estruc, rec.cruces;
END; $$;
-- Procedimiento almacenado para actualizar la entidad ESTRUCTURA
CREATE OR REPLACE PROCEDURE update_estructura(p_id_estruc INT, p_id_lugar_estruc INT, p_id_tipo_estruc INT, p_id_est_estruc INT, p_cruces BOOL)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE estructura SET id_lugar_estruc = p_id_lugar_estruc, id_tipo_estruc = p_id_tipo_estruc, id_est_estruc = p_id_est_estruc, cruces = p_cruces WHERE id_estruc = p_id_estruc;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad ESTRUCTURA
CREATE OR REPLACE PROCEDURE delete_estructura(p_id_estruc INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM estructura WHERE id_estruc = p_id_estruc;
END; $$;


-- Procedimiento almacenado para insertar en la entidad LUGAR_ESTRUCTURA
CREATE OR REPLACE PROCEDURE insert_lugar_estructura(p_id_lugar_estruc INT, p_name_zona TEXT, p_name_manza TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO lugar_estructura (id_lugar_estruc, name_zona, name_manza) VALUES (p_id_lugar_estruc, p_name_zona, p_name_manza);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad LUGAR_ESTRUCTURA
CREATE OR REPLACE PROCEDURE select_lugar_estructura(p_id_lugar_estruc INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM lugar_estructura WHERE id_lugar_estruc = p_id_lugar_estruc;
    RAISE NOTICE 'id_lugar_estruc: %, name_zona: %, name_manza: %', rec.id_lugar_estruc, rec.name_zona, rec.name_manza;
END; $$;
-- Procedimiento almacenado para actualizar la entidad LUGAR_ESTRUCTURA
CREATE OR REPLACE PROCEDURE update_lugar_estructura(p_id_lugar_estruc INT, p_name_zona TEXT, p_name_manza TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE lugar_estructura SET name_zona = p_name_zona, name_manza = p_name_manza WHERE id_lugar_estruc = p_id_lugar_estruc;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad LUGAR_ESTRUCTURA
CREATE OR REPLACE PROCEDURE delete_lugar_estructura(p_id_lugar_estruc INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM lugar_estructura WHERE id_lugar_estruc = p_id_lugar_estruc;
END; $$;


-- Procedimiento almacenado para insertar en la entidad PAGO
CREATE OR REPLACE PROCEDURE insert_pago(p_id_pago INT, p_id_tipo_pago INT, p_id_tram INT, p_cant_pago DECIMAL(6), p_fch_pago DATE)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO pago (id_pago, id_tipo_pago, id_tram, cant_pago, fch_pago) VALUES (p_id_pago, p_id_tipo_pago, p_id_tram, p_cant_pago, p_fch_pago);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad PAGO
CREATE OR REPLACE PROCEDURE select_pago(p_id_pago INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM pago WHERE id_pago = p_id_pago;
    RAISE NOTICE 'id_pago: %, id_tipo_pago: %, id_tram: %, cant_pago: %, fch_pago: %', rec.id_pago, rec.id_tipo_pago, rec.id_tram, rec.cant_pago, rec.fch_pago;
END; $$;
-- Procedimiento almacenado para actualizar la entidad PAGO
CREATE OR REPLACE PROCEDURE update_pago(p_id_pago INT, p_id_tipo_pago INT, p_id_tram INT, p_cant_pago DECIMAL(6), p_fch_pago DATE)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE pago SET id_tipo_pago = p_id_tipo_pago, id_tram = p_id_tram, cant_pago = p_cant_pago, fch_pago = p_fch_pago WHERE id_pago = p_id_pago;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad PAGO
CREATE OR REPLACE PROCEDURE delete_pago(p_id_pago INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM pago WHERE id_pago = p_id_pago;
END; $$;

-- Procedimiento almacenado para insertar en la entidad PERSONAL
CREATE OR REPLACE PROCEDURE insert_personal(p_id_per INT, p_id_tipo_per INT, p_ci_per VARCHAR(10), p_name_per TEXT, p_lname_per TEXT, p_fch_naci_per DATE, p_tel1_per VARCHAR(10), p_tel2_per VARCHAR(10))
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO personal (id_per, id_tipo_per, ci_per, name_per, lname_per, fch_naci_per, tel1_per, tel2_per) VALUES (p_id_per, p_id_tipo_per, p_ci_per, p_name_per, p_lname_per, p_fch_naci_per, p_tel1_per, p_tel2_per);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad PERSONAL
CREATE OR REPLACE PROCEDURE select_personal(p_id_per INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM personal WHERE id_per = p_id_per;
    RAISE NOTICE 'id_per: %, id_tipo_per: %, ci_per: %, name_per: %, lname_per: %, fch_naci_per: %, tel1_per: %, tel2_per: %', rec.id_per, rec.id_tipo_per, rec.ci_per, rec.name_per, rec.lname_per, rec.fch_naci_per, rec.tel1_per, rec.tel2_per;
END; $$;
-- Procedimiento almacenado para actualizar la entidad PERSONAL
CREATE OR REPLACE PROCEDURE update_personal(p_id_per INT, p_id_tipo_per INT, p_ci_per VARCHAR(10), p_name_per TEXT, p_lname_per TEXT, p_fch_naci_per DATE, p_tel1_per VARCHAR(10), p_tel2_per VARCHAR(10))
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE personal SET id_tipo_per = p_id_tipo_per, ci_per = p_ci_per, name_per = p_name_per, lname_per = p_lname_per, fch_naci_per = p_fch_naci_per, tel1_per = p_tel1_per, tel2_per = p_tel2_per WHERE id_per = p_id_per;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad PERSONAL
CREATE OR REPLACE PROCEDURE delete_personal(p_id_per INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM personal WHERE id_per = p_id_per;
END; $$;


-- Procedimiento almacenado para insertar en la entidad PROVINCIA
CREATE OR REPLACE PROCEDURE insert_provincia(p_id_pro INT, p_name_pro TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO provincia (id_pro, name_pro) VALUES (p_id_pro, p_name_pro);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad PROVINCIA
CREATE OR REPLACE PROCEDURE select_provincia(p_id_pro INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM provincia WHERE id_pro = p_id_pro;
    RAISE NOTICE 'id_pro: %, name_pro: %', rec.id_pro, rec.name_pro;
END; $$;
-- Procedimiento almacenado para actualizar la entidad PROVINCIA
CREATE OR REPLACE PROCEDURE update_provincia(p_id_pro INT, p_name_pro TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE provincia SET name_pro = p_name_pro WHERE id_pro = p_id_pro;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad PROVINCIA
CREATE OR REPLACE PROCEDURE delete_provincia(p_id_pro INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM provincia WHERE id_pro = p_id_pro;
END; $$;

-- Procedimiento almacenado para insertar en la entidad REPORTE_INCIDENTE
CREATE OR REPLACE PROCEDURE insert_reporte_incidente(p_id_inci INT, p_id_tipo_inci INT, p_id_per INT, p_fch_rep_inc DATE)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO reporte_incidente (id_inci, id_tipo_inci, id_per, fch_rep_inc) VALUES (p_id_inci, p_id_tipo_inci, p_id_per, p_fch_rep_inc);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad REPORTE_INCIDENTE
CREATE OR REPLACE PROCEDURE select_reporte_incidente(p_id_inci INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM reporte_incidente WHERE id_inci = p_id_inci;
    RAISE NOTICE 'id_inci: %, id_tipo_inci: %, id_per: %, fch_rep_inc: %', rec.id_inci, rec.id_tipo_inci, rec.id_per, rec.fch_rep_inc;
END; $$;
-- Procedimiento almacenado para actualizar la entidad REPORTE_INCIDENTE
CREATE OR REPLACE PROCEDURE update_reporte_incidente(p_id_inci INT, p_id_tipo_inci INT, p_id_per INT, p_fch_rep_inc DATE)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE reporte_incidente SET id_tipo_inci = p_id_tipo_inci, id_per = p_id_per, fch_rep_inc = p_fch_rep_inc WHERE id_inci = p_id_inci;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad REPORTE_INCIDENTE
CREATE OR REPLACE PROCEDURE delete_reporte_incidente(p_id_inci INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM reporte_incidente WHERE id_inci = p_id_inci;
END; $$;

-- Procedimiento almacenado para insertar en la entidad TIPO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE insert_tipo_estructura(p_id_tipo_estruc INT, p_name_tipo_estruc TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO tipo_estructura (id_tipo_estruc, name_tipo_estruc) VALUES (p_id_tipo_estruc, p_name_tipo_estruc);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad TIPO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE select_tipo_estructura(p_id_tipo_estruc INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM tipo_estructura WHERE id_tipo_estruc = p_id_tipo_estruc;
    RAISE NOTICE 'id_tipo_estruc: %, name_tipo_estruc: %', rec.id_tipo_estruc, rec.name_tipo_estruc;
END; $$;
-- Procedimiento almacenado para actualizar la entidad TIPO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE update_tipo_estructura(p_id_tipo_estruc INT, p_name_tipo_estruc TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE tipo_estructura SET name_tipo_estruc = p_name_tipo_estruc WHERE id_tipo_estruc = p_id_tipo_estruc;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad TIPO_ESTRUCTURA
CREATE OR REPLACE PROCEDURE delete_tipo_estructura(p_id_tipo_estruc INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM tipo_estructura WHERE id_tipo_estruc = p_id_tipo_estruc;
END; $$;


-- Procedimiento almacenado para insertar en la entidad TIPO_INCIDENTE
CREATE OR REPLACE PROCEDURE insert_tipo_incidente(p_id_tipo_inci INT, p_name_tipo_inci VARCHAR(30))
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO tipo_incidente (id_tipo_inci, name_tipo_inci) VALUES (p_id_tipo_inci, p_name_tipo_inci);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad TIPO_INCIDENTE
CREATE OR REPLACE PROCEDURE select_tipo_incidente(p_id_tipo_inci INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM tipo_incidente WHERE id_tipo_inci = p_id_tipo_inci;
    RAISE NOTICE 'id_tipo_inci: %, name_tipo_inci: %', rec.id_tipo_inci, rec.name_tipo_inci;
END; $$;
-- Procedimiento almacenado para actualizar la entidad TIPO_INCIDENTE
CREATE OR REPLACE PROCEDURE update_tipo_incidente(p_id_tipo_inci INT, p_name_tipo_inci VARCHAR(30))
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE tipo_incidente SET name_tipo_inci = p_name_tipo_inci WHERE id_tipo_inci = p_id_tipo_inci;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad TIPO_INCIDENTE
CREATE OR REPLACE PROCEDURE delete_tipo_incidente(p_id_tipo_inci INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM tipo_incidente WHERE id_tipo_inci = p_id_tipo_inci;
END; $$;

-- Procedimiento almacenado para insertar en la entidad TIPO_PAGO
CREATE OR REPLACE PROCEDURE insert_tipo_pago(p_id_tipo_pago INT, p_name_tipo_pago TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO tipo_pago (id_tipo_pago, name_tipo_pago) VALUES (p_id_tipo_pago, p_name_tipo_pago);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad TIPO_PAGO
CREATE OR REPLACE PROCEDURE select_tipo_pago(p_id_tipo_pago INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM tipo_pago WHERE id_tipo_pago = p_id_tipo_pago;
    RAISE NOTICE 'id_tipo_pago: %, name_tipo_pago: %', rec.id_tipo_pago, rec.name_tipo_pago;
END; $$;
-- Procedimiento almacenado para actualizar la entidad TIPO_PAGO
CREATE OR REPLACE PROCEDURE update_tipo_pago(p_id_tipo_pago INT, p_name_tipo_pago TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE tipo_pago SET name_tipo_pago = p_name_tipo_pago WHERE id_tipo_pago = p_id_tipo_pago;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad TIPO_PAGO
CREATE OR REPLACE PROCEDURE delete_tipo_pago(p_id_tipo_pago INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM tipo_pago WHERE id_tipo_pago = p_id_tipo_pago;
END; $$;

-- Procedimiento almacenado para insertar en la entidad TIPO_PERSONAL
CREATE OR REPLACE PROCEDURE insert_tipo_personal(p_id_tipo_per INT, p_name_tipo_per TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO tipo_personal (id_tipo_per, name_tipo_per) VALUES (p_id_tipo_per, p_name_tipo_per);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad TIPO_PERSONAL
CREATE OR REPLACE PROCEDURE select_tipo_personal(p_id_tipo_per INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM tipo_personal WHERE id_tipo_per = p_id_tipo_per;
    RAISE NOTICE 'id_tipo_per: %, name_tipo_per: %', rec.id_tipo_per, rec.name_tipo_per;
END; $$;
-- Procedimiento almacenado para actualizar la entidad TIPO_PERSONAL
CREATE OR REPLACE PROCEDURE update_tipo_personal(p_id_tipo_per INT, p_name_tipo_per TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE tipo_personal SET name_tipo_per = p_name_tipo_per WHERE id_tipo_per = p_id_tipo_per;
END; $$;

-- Procedimiento almacenado para eliminar de la entidad TIPO_PERSONAL
CREATE OR REPLACE PROCEDURE delete_tipo_personal(p_id_tipo_per INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM tipo_personal WHERE id_tipo_per = p_id_tipo_per;
END; $$;


-- Procedimiento almacenado para insertar en la entidad TIPO_TRAMITE
CREATE OR REPLACE PROCEDURE insert_tipo_tramite(p_id_tipo_tram INT, p_name_tipo_tram TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO tipo_tramite (id_tipo_tram, name_tipo_tram) VALUES (p_id_tipo_tram, p_name_tipo_tram);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad TIPO_TRAMITE
CREATE OR REPLACE PROCEDURE select_tipo_tramite(p_id_tipo_tram INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM tipo_tramite WHERE id_tipo_tram = p_id_tipo_tram;
    RAISE NOTICE 'id_tipo_tram: %, name_tipo_tram: %', rec.id_tipo_tram, rec.name_tipo_tram;
END; $$;
-- Procedimiento almacenado para actualizar la entidad TIPO_TRAMITE
CREATE OR REPLACE PROCEDURE update_tipo_tramite(p_id_tipo_tram INT, p_name_tipo_tram TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE tipo_tramite SET name_tipo_tram = p_name_tipo_tram WHERE id_tipo_tram = p_id_tipo_tram;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad TIPO_TRAMITE
CREATE OR REPLACE PROCEDURE delete_tipo_tramite(p_id_tipo_tram INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM tipo_tramite WHERE id_tipo_tram = p_id_tipo_tram;
END; $$;


-- Procedimiento almacenado para insertar en la entidad TRAMITE
CREATE OR REPLACE PROCEDURE insert_tramite(p_id_tram INT, p_id_tipo_tram TEXT, p_id_clien1 INT, p_id_clien2 INT, p_id_clien3 INT, p_id_clien4 INT, p_fch_tram1 DATE, p_fch_tram2 DATE, p_sms_tram TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO tramite (id_tram, id_tipo_tram, id_clien1, id_clien2, id_clien3, id_clien4, fch_tram1, fch_tram2, sms_tram) VALUES (p_id_tram, p_id_tipo_tram, p_id_clien1, p_id_clien2, p_id_clien3, p_id_clien4, p_fch_tram1, p_fch_tram2, p_sms_tram);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad TRAMITE
CREATE OR REPLACE PROCEDURE select_tramite(p_id_tram INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM tramite WHERE id_tram = p_id_tram;
    RAISE NOTICE 'id_tram: %, id_tipo_tram: %, id_clien1: %, id_clien2: %, id_clien3: %, id_clien4: %, fch_tram1: %, fch_tram2: %, sms_tram: %', rec.id_tram, rec.id_tipo_tram, rec.id_clien1, rec.id_clien2, rec.id_clien3, rec.id_clien4, rec.fch_tram1, rec.fch_tram2, rec.sms_tram;
END; $$;
-- Procedimiento almacenado para actualizar la entidad TRAMITE
CREATE OR REPLACE PROCEDURE update_tramite(p_id_tram INT, p_id_tipo_tram TEXT, p_id_clien1 INT, p_id_clien2 INT, p_id_clien3 INT, p_id_clien4 INT, p_fch_tram1 DATE, p_fch_tram2 DATE, p_sms_tram TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE tramite SET id_tipo_tram = p_id_tipo_tram, id_clien1 = p_id_clien1, id_clien2 = p_id_clien2, id_clien3 = p_id_clien3, id_clien4 = p_id_clien4, fch_tram1 = p_fch_tram1, fch_tram2 = p_fch_tram2, sms_tram = p_sms_tram WHERE id_tram = p_id_tram;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad TRAMITE
CREATE OR REPLACE PROCEDURE delete_tramite(p_id_tram INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM tramite WHERE id_tram = p_id_tram;
END; $$;

-- Procedimiento almacenado para insertar en la entidad UBICACION
CREATE OR REPLACE PROCEDURE insert_ubicacion(p_id_ubi INT, p_id_pro TEXT, p_id_can INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO ubicacion (id_ubi, id_pro, id_can) VALUES (p_id_ubi, p_id_pro, p_id_can);
END; $$;
-- Procedimiento almacenado para seleccionar de la entidad UBICACION
CREATE OR REPLACE PROCEDURE select_ubicacion(p_id_ubi INT)
LANGUAGE plpgsql AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec FROM ubicacion WHERE id_ubi = p_id_ubi;
    RAISE NOTICE 'id_ubi: %, id_pro: %, id_can: %', rec.id_ubi, rec.id_pro, rec.id_can;
END; $$;
-- Procedimiento almacenado para actualizar la entidad UBICACION
CREATE OR REPLACE PROCEDURE update_ubicacion(p_id_ubi INT, p_id_pro TEXT, p_id_can INT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE ubicacion SET id_pro = p_id_pro, id_can = p_id_can WHERE id_ubi = p_id_ubi;
END; $$;
-- Procedimiento almacenado para eliminar de la entidad UBICACION
CREATE OR REPLACE PROCEDURE delete_ubicacion(p_id_ubi INT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM ubicacion WHERE id_ubi = p_id_ubi;
END; $$;

