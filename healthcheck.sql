CREATE USER healthcheck@'127.0.0.1' IDENTIFIED BY 'myVeryRandomPassword';
CREATE USER healthcheck@'::1' IDENTIFIED BY 'myVeryRandomPassword';
CREATE USER healthcheck@localhost IDENTIFIED BY 'myVeryRandomPassword';
GRANT USAGE ON *.* TO healthcheck@'127.0.0.1';
GRANT USAGE ON *.* TO healthcheck@'::1';
GRANT USAGE ON *.* TO healthcheck@localhost;
