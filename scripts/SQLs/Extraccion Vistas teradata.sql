         
   SELECT RANK(T1."VIEWNAME") AS ID,
    T1."TEXTO"(VARCHAR(20000)),
     T1."OWNER",
     T1."DATABASE",
     T1."TABLE",
     T1."VIEWNAME"
    FROM (
    SELECT 
        RequestText(CLOB(20K)) as CSQL_TEXT,
        UPPER(TRIM(DatabaseName)||'.'||TRIM(TableName)) AS "VIEWNAME",
        REGEXP_REPLACE(CSQL_TEXT(CLOB(20K)),'((--)(.*?)$)|(/\*(.*)[^\*/]\*/)|(\")|(;)','',1,0,'m')(CLOB(20K)) AS "SQL_TRATADO",
        REGEXP_REPLACE(SQL_TRATADO(CLOB(20K)),'(\s){1,}|(\s){1,}$|$',' ',1,0,'m')(CLOB(20K)) AS "TEXTO",
        UPPER(TRIM(CreatorName)) "OWNER",
        UPPER(TRIM(DatabaseName)) "DATABASE",
        UPPER(TRIM(TableName)) "TABLE"
        FROM dbc.tables
        WHERE tablekind='V'
            AND  CreatorName  NOT IN ('DBC','SystemFe')
    
    ) as T1
    
    
;
