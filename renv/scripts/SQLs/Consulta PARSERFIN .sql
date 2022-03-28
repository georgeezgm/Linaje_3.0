
SELECT * FROM god_parser_fin
WHERE (cast(it_ini_consulta as date format 'yyyymmdd') BETWEEN cast('20210901' as date format 'yyyymmdd') AND cast('20210910' as date format 'yyyymmdd'))
ORDER BY co_query_amp asc , orden asc;