CREATE TABLE USBGODA.GDVIEWTO (OWNER VARCHAR2(30) Not Null,VIEW_NAME VARCHAR2(30) Not Null,SQLTEXT CLOB);
TRUNCATE TABLE USBGODA.ALL_VIEWS;

INSERT INTO USBGODA.GDVIEWTO(select u.name, o.name, to_LOB(v.text)
FROM
   sys."_CURRENT_EDITION_OBJ" o, sys.view$ v, sys.user$ u
   where o.obj# = v.obj#
    and o.owner# = u.user#);
    COMMIT; 
