--Insert 프로시저
--
CREATE OR REPLACE PROCEDURE add_buytbl
(p_idnum buytbl.idnum%TYPE
, p_userid buytbl.userid%TYPE
, p_prodname buytbl.prodname%TYPE
, p_groupname buytbl.groupname%TYPE
, p_price buytbl.price%TYPE
, p_amount buytbl.amount%TYPE
, p_sss buytbl.sss%TYPE)
IS
BEGIN
INSERT INTO buytbl(idnum, userid, prodname, groupname, price, amount, sss)
VALUES (p_idnum, p_userid, p_prodname, p_groupname, p_price, p_amount, p_sss);
COMMIT;
END add_buytbl;

--Update 프로시저
--
CREATE OR REPLACE PROCEDURE update_buytbl
( p_idnum buytbl.idnum%TYPE
, p_userid buytbl.userid%TYPE
, p_prodname buytbl.prodname%TYPE := 'p'
, p_groupname buytbl.groupname%TYPE := 'g'
, p_price buytbl.price%TYPE DEFAULT 0
, p_amount buytbl.amount%TYPE DEFAULT 0
) 
IS
BEGIN
UPDATE buytbl SET
prodname = p_prodname ,groupname = p_groupname ,price = p_price ,amount = p_amount
WHERE idnum=p_idnum;
COMMIT;
END update_buytbl;

--Delete 프로시저
--
CREATE OR REPLACE PROCEDURE del_buytbl
( p_idnum buytbl.idnum%TYPE) 
IS
zeroDelete EXCEPTION;
BEGIN
DELETE FROM buytbl WHERE idnum=p_idnum;
COMMIT;
END del_buytbl;


EXECUTE del_buytbl(31);

--Select 프로시저
--
CREATE OR REPLACE PROCEDURE SELECTALLCOLUMN_BUYTBL 
 (p_cursor OUT SYS_REFCURSOR)
 IS
 BEGIN
 OPEN p_cursor FOR
 SELECT * FROM BUYTBL;
END SELECTALLCOLUMN_BUYTBL;

































































































