#!/bin/bash
DIA=`date +%d`
MES=`date +%m`
ANIO=`date +%Y`
ARCHIVOIN="InternosActivos_REMEDY_MovimientosPersonal_"$ANIO$MES$DIA$".xls"
ARCHIVOEX="ExternosActivos_REMEDY_MovimientosPersonal_"$ANIO$MES$DIA$".xls"
ARCHIVOBAJAS="InternosBajas_REMEDY_MovimientosPersonal_"$ANIO$MES$DIA$".xls"
ARCHIVOINC="InternosCambios_REMEDY_MovimientosPersonal_"$ANIO$MES$DIA$".xls"
ARCHIVOEXC="ExternosCambios_REMEDY_MovimientosPersonal_"$ANIO$MES$DIA$".xls"
ssh nomina@10.119.79.178 <<EOF
cd /home/remedy/NominaTMP
chmod 666 $ARCHIVOIN
chmod 666 $ARCHIVOEX
chmod 666 $ARCHIVOINC
chmod 666 $ARCHIVOEXC
chmod 666 $ARCHIVOBAJAS
EOF


