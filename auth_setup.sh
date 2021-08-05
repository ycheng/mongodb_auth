#! /bin/bash

set -x

ADMIN_USER="admin"
ADMIN_PWD="admin"

DB_NAME="sample_db"
DB_USER="sample_user"
DB_PWD="sample_pwd"

# mongo -u "$ADMIN_USER" -p "$ADMIN_PWD" << EOF
mongo << EOF
use admin

db.createUser(
  {
    user: "$ADMIN_USER",
    pwd: "$ADMIN_PWD",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]
  }
)

db.createUser(
  {
    user: "$DB_USER",
    pwd: "$DB_PWD", // or cleartext password
    roles: [ { role: "read", db: "$DB_NAME" } ]
  }
)

EOF

