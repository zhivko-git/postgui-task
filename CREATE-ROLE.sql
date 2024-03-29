CREATE ROLE readuser;
GRANT CONNECT ON DATABASE dvdrental TO readuser;
GRANT USAGE ON SCHEMA public TO readuser;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readuser;
CREATE ROLE edituser;
GRANT CONNECT ON DATABASE dvdrental TO edituser;
GRANT USAGE ON SCHEMA public TO edituser;
GRANT SELECT ON ALL TABLES IN SCHEMA public to edituser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public to edituser;
GRANT EXECUTE ON FUNCTION primary_keys() to edituser;
GRANT EXECUTE ON FUNCTION foreign_keys() to edituser;