/******************************************************************************
* tests.sql
*
* Authors: David Blodgett, Christian Doolittle
* Description:
*   These are the tests from the midterm assignment description.
******************************************************************************/

SELECT
  TABLE_NAME,
  COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  CONSTRAINT_NAME = 'PRIMARY'
  AND TABLE_SCHEMA = 'coffee';

SELECT
  table_name AS 'Table',
  column_name AS 'Column',
  constraint_name AS 'Constraint',
  referenced_table_name AS 'Referenced Table',
  referenced_column_name AS 'Referenced Column'
FROM
  information_schema.key_column_usage
WHERE
  referenced_table_name IS NOT NULL
  AND table_schema = 'coffee';

SELECT
  TC.TABLE_NAME,
  KCU.COLUMN_NAME,
  TC.CONSTRAINT_NAME
FROM
  INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
  JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU
  ON TC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
WHERE
  TC.CONSTRAINT_TYPE = 'UNIQUE'
  AND TC.TABLE_SCHEMA = 'coffee';

SELECT
  TC.TABLE_NAME,
  CC.CONSTRAINT_NAME,
  CC.CHECK_CLAUSE
FROM
  INFORMATION_SCHEMA.CHECK_CONSTRAINTS AS CC
  JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
  ON CC.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
WHERE
  CC.CONSTRAINT_SCHEMA = 'coffee';

SELECT
  TABLE_NAME,
  COLUMN_NAME,
  COLUMN_DEFAULT
FROM
  INFORMATION_SCHEMA.COLUMNS
WHERE
  COLUMN_DEFAULT IS NOT NULL
  AND TABLE_SCHEMA = 'coffee';