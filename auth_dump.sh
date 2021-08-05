#! /bin/bash

set -x

mongo << EOF
use admin
db.system.users.find()
EOF

