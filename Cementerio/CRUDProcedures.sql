CREATE OR REPLACE PROCEDURE Createtramite(id_tram VARCHAR, id_tipo_tram VARCHAR, id_clien VARCHAR, id_difu VARCHAR, id_estruc VARCHAR, id_per VARCHAR, fch_tram VARCHAR, fch_cumpli_tram VARCHAR, sms_tram VARCHAR) AS $$
BEGIN
INSERT INTO tramite(id_tram, id_tipo_tram, id_clien, id_difu, id_estruc, id_per, fch_tram, fch_cumpli_tram, sms_tram) VALUES ($id_tram, $id_tipo_tram, $id_clien, $id_difu, $id_estruc, $id_per, $fch_tram, $fch_cumpli_tram, $sms_tram);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletetramite(IN id VARCHAR) AS $$
BEGIN
DELETE FROM tramite WHERE id_tram = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createcertificado(id_certi VARCHAR, id_tram VARCHAR) AS $$
BEGIN
INSERT INTO certificado(id_certi, id_tram) VALUES ($id_certi, $id_tram);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletecertificado(IN id VARCHAR) AS $$
BEGIN
DELETE FROM certificado WHERE id_certi = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createubicacion(id_ubi VARCHAR, id_pro VARCHAR, id_can VARCHAR) AS $$
BEGIN
INSERT INTO ubicacion(id_ubi, id_pro, id_can) VALUES ($id_ubi, $id_pro, $id_can);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deleteubicacion(IN id VARCHAR) AS $$
BEGIN
DELETE FROM ubicacion WHERE id_ubi = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createcliente(id_clien VARCHAR, id_ubi VARCHAR, ci_clien VARCHAR, name_clien VARCHAR, lname_clien VARCHAR, fch_naci_clien VARCHAR, tel1_clien VARCHAR, tel2_clien VARCHAR) AS $$
BEGIN
INSERT INTO cliente(id_clien, id_ubi, ci_clien, name_clien, lname_clien, fch_naci_clien, tel1_clien, tel2_clien) VALUES ($id_clien, $id_ubi, $ci_clien, $name_clien, $lname_clien, $fch_naci_clien, $tel1_clien, $tel2_clien);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletecliente(IN id VARCHAR) AS $$
BEGIN
DELETE FROM cliente WHERE id_clien = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createcausa_muerte(id_cau_mue VARCHAR, name_cau_mue VARCHAR) AS $$
BEGIN
INSERT INTO causa_muerte(id_cau_mue, name_cau_mue) VALUES ($id_cau_mue, $name_cau_mue);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletecausa_muerte(IN id VARCHAR) AS $$
BEGIN
DELETE FROM causa_muerte WHERE id_cau_mue = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createdifunto(id_difu VARCHAR, id_cau_mue VARCHAR, name_difu VARCHAR, lastn_difu VARCHAR, fch_naci_difu VARCHAR, fch_muerte_difu VARCHAR, code_acta_difu VARCHAR) AS $$
BEGIN
INSERT INTO difunto(id_difu, id_cau_mue, name_difu, lastn_difu, fch_naci_difu, fch_muerte_difu, code_acta_difu) VALUES ($id_difu, $id_cau_mue, $name_difu, $lastn_difu, $fch_naci_difu, $fch_muerte_difu, $code_acta_difu);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletedifunto(IN id VARCHAR) AS $$
BEGIN
DELETE FROM difunto WHERE id_difu = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createestado_estructura(id_est_estruc VARCHAR, name_est_estruc VARCHAR) AS $$
BEGIN
INSERT INTO estado_estructura(id_est_estruc, name_est_estruc) VALUES ($id_est_estruc, $name_est_estruc);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deleteestado_estructura(IN id VARCHAR) AS $$
BEGIN
DELETE FROM estado_estructura WHERE id_est_estruc = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createestructura(id_estruc VARCHAR, id_lugar_estruc VARCHAR, id_tipo_estruc VARCHAR, id_est_estruc VARCHAR, cruces VARCHAR) AS $$
BEGIN
INSERT INTO estructura(id_estruc, id_lugar_estruc, id_tipo_estruc, id_est_estruc, cruces) VALUES ($id_estruc, $id_lugar_estruc, $id_tipo_estruc, $id_est_estruc, $cruces);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deleteestructura(IN id VARCHAR) AS $$
BEGIN
DELETE FROM estructura WHERE id_estruc = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createlugar_estructura(id_lugar_estruc VARCHAR, name_zona VARCHAR, name_manza VARCHAR) AS $$
BEGIN
INSERT INTO lugar_estructura(id_lugar_estruc, name_zona, name_manza) VALUES ($id_lugar_estruc, $name_zona, $name_manza);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletelugar_estructura(IN id VARCHAR) AS $$
BEGIN
DELETE FROM lugar_estructura WHERE id_lugar_estruc = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createtipo_estructura(id_tipo_estruc VARCHAR, name_tipo_estruc VARCHAR) AS $$
BEGIN
INSERT INTO tipo_estructura(id_tipo_estruc, name_tipo_estruc) VALUES ($id_tipo_estruc, $name_tipo_estruc);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletetipo_estructura(IN id VARCHAR) AS $$
BEGIN
DELETE FROM tipo_estructura WHERE id_tipo_estruc = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createtipo_pago(id_tipo_pago VARCHAR, name_tipo_pago VARCHAR) AS $$
BEGIN
INSERT INTO tipo_pago(id_tipo_pago, name_tipo_pago) VALUES ($id_tipo_pago, $name_tipo_pago);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletetipo_pago(IN id VARCHAR) AS $$
BEGIN
DELETE FROM tipo_pago WHERE id_tipo_pago = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createpago(id_pago VARCHAR, id_tipo_pago VARCHAR, id_tram VARCHAR, cant_pago VARCHAR, fch_pago VARCHAR) AS $$
BEGIN
INSERT INTO pago(id_pago, id_tipo_pago, id_tram, cant_pago, fch_pago) VALUES ($id_pago, $id_tipo_pago, $id_tram, $cant_pago, $fch_pago);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletepago(IN id VARCHAR) AS $$
BEGIN
DELETE FROM pago WHERE id_pago = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createtipo_personal(id_tipo_per VARCHAR, name_tipo_per VARCHAR) AS $$
BEGIN
INSERT INTO tipo_personal(id_tipo_per, name_tipo_per) VALUES ($id_tipo_per, $name_tipo_per);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletetipo_personal(IN id VARCHAR) AS $$
BEGIN
DELETE FROM tipo_personal WHERE id_tipo_per = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createpersonal(id_per VARCHAR, id_tipo_per VARCHAR, ci_per VARCHAR, name_per VARCHAR, lname_per VARCHAR, fch_naci_per VARCHAR, tel1_per VARCHAR, tel2_per VARCHAR) AS $$
BEGIN
INSERT INTO personal(id_per, id_tipo_per, ci_per, name_per, lname_per, fch_naci_per, tel1_per, tel2_per) VALUES ($id_per, $id_tipo_per, $ci_per, $name_per, $lname_per, $fch_naci_per, $tel1_per, $tel2_per);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletepersonal(IN id VARCHAR) AS $$
BEGIN
DELETE FROM personal WHERE id_per = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createreporte_incidente(id_inci VARCHAR, id_tipo_inci VARCHAR, id_per VARCHAR, fch_rep_inc VARCHAR) AS $$
BEGIN
INSERT INTO reporte_incidente(id_inci, id_tipo_inci, id_per, fch_rep_inc) VALUES ($id_inci, $id_tipo_inci, $id_per, $fch_rep_inc);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletereporte_incidente(IN id VARCHAR) AS $$
BEGIN
DELETE FROM reporte_incidente WHERE id_inci = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createtipo_incidente(id_tipo_inci VARCHAR, name_tipo_inci VARCHAR) AS $$
BEGIN
INSERT INTO tipo_incidente(id_tipo_inci, name_tipo_inci) VALUES ($id_tipo_inci, $name_tipo_inci);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletetipo_incidente(IN id VARCHAR) AS $$
BEGIN
DELETE FROM tipo_incidente WHERE id_tipo_inci = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createtipo_tramite(id_tipo_tram VARCHAR, name_tipo_tram VARCHAR) AS $$
BEGIN
INSERT INTO tipo_tramite(id_tipo_tram, name_tipo_tram) VALUES ($id_tipo_tram, $name_tipo_tram);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletetipo_tramite(IN id VARCHAR) AS $$
BEGIN
DELETE FROM tipo_tramite WHERE id_tipo_tram = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createcanton(id_can VARCHAR, name_can VARCHAR) AS $$
BEGIN
INSERT INTO canton(id_can, name_can) VALUES ($id_can, $name_can);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletecanton(IN id VARCHAR) AS $$
BEGIN
DELETE FROM canton WHERE id_can = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createprovincia(id_pro VARCHAR, name_pro VARCHAR) AS $$
BEGIN
INSERT INTO provincia(id_pro, name_pro) VALUES ($id_pro, $name_pro);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deleteprovincia(IN id VARCHAR) AS $$
BEGIN
DELETE FROM provincia WHERE id_pro = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createfactura(id_factura VARCHAR, fecha VARCHAR, cliente VARCHAR, total VARCHAR) AS $$
BEGIN
INSERT INTO factura(id_factura, fecha, cliente, total) VALUES ($id_factura, $fecha, $cliente, $total);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deletefactura(IN id VARCHAR) AS $$
BEGIN
DELETE FROM factura WHERE id_factura = id;
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Createaudit_log(id VARCHAR, tabla VARCHAR, operacion VARCHAR, usuario VARCHAR, fecha VARCHAR, datos_antiguos VARCHAR, datos_nuevos VARCHAR) AS $$
BEGIN
INSERT INTO audit_log(id, tabla, operacion, usuario, fecha, datos_antiguos, datos_nuevos) VALUES ($id, $tabla, $operacion, $usuario, $fecha, $datos_antiguos, $datos_nuevos);
END; $$ LANGUAGE plpgsql;
CREATE OR REPLACE PROCEDURE Deleteaudit_log(IN id VARCHAR) AS $$
BEGIN
DELETE FROM audit_log WHERE id = id;
END; $$ LANGUAGE plpgsql;
