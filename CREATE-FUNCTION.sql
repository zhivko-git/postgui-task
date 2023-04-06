CREATE OR REPLACE FUNCTION foreign_keys () RETURNS json IMMUTABLE LANGUAGE SQL AS $$
  SELECT COALESCE(Array_to_json(Array_agg(Row_to_json(row))), '[]')
  FROM   (
    SELECT o.conname AS CONSTRAINT_NAME,
       m.relname AS TABLE_NAME,
  (SELECT a.attname
   FROM pg_attribute a
   WHERE a.attrelid = m.oid
     AND a.attnum = o.conkey[1]
     AND a.attisdropped = FALSE) AS COLUMN_NAME,
       f.relname AS foreign_table,
  (SELECT a.attname
   FROM pg_attribute a
   WHERE a.attrelid = f.oid
     AND a.attnum = o.confkey[1]
     AND a.attisdropped = FALSE) AS foreign_column
FROM pg_constraint o
LEFT JOIN pg_class c ON c.oid = o.conrelid
LEFT JOIN pg_class f ON f.oid = o.confrelid
LEFT JOIN pg_class m ON m.oid = o.conrelid
WHERE o.contype = 'f'
  AND o.conrelid IN
    (SELECT oid
     FROM pg_class c
     WHERE c.relkind = 'r')
    ) row;
  $$ ;


CREATE OR REPLACE FUNCTION primary_keys() RETURNS json IMMUTABLE LANGUAGE SQL AS $$
  SELECT COALESCE(Array_to_json(Array_agg(Row_to_json(row))), '[]')
  FROM (
    SELECT t.table_name AS TABLE, array_agg(c.column_name::text) AS PRIMARY_KEYS
    FROM information_schema.key_column_usage AS c LEFT JOIN information_schema.table_constraints AS t ON t.constraint_name = c.constraint_name
    WHERE t.constraint_type = 'PRIMARY KEY'
    GROUP BY t.table_name
    ORDER BY t.table_name) row;
$$;