#!/bin/bash
cd /home/remedy/NominaTMP
sftp 10.119.79.34 <<EOF
cd /opt/bmc/import 
put NominaCompleto.csv
EOF
