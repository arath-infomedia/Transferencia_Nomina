#PRM: -d Bandera de Debug
#PRM: -h Muestra la ayuda
#VRS: 2.0
#PRG: REV
#FCH: 13/05/2015-13/05/2015

#Variables de entorno
DIR_HOME=/webapps/Nominav2/WEB-INF #Directorio HOME
DIR_CLASSES=$DIR_HOME/classes #Directorio de clases
DIR_LIB=$DIR_HOME/lib #Directorio de librerias
##variables para pasar a desarrollo
DIA=`date +%d`
MES=`date +%m`
ANIO=`date +%y`
HORA=`date +%H`
ARCHIVOIN="BAJAS_INTERNOS"$ANIO$MES$DIA$".csv"
ARCHIVOEX="BAJAS_EXTERNOS"$ANIO$MES$DIA$".xls"


##JAVA_HOME=/usr/java/jdk1.7.0_76/ #jdk 1.6
#JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64
JAVA_HOME=/usr/lib/jvm/jre/

PATH="$DIR_CLASSES:$DIR_LIB:$JAVA_HOME:$JAVA_HOME/bin:$JAVA_HOME/lib:$PATH" #Variable PATH
CLASSPATH="./:$DIR_CLASSES:$DIR_LIB" #Variable CLASSPATH
LD_LIBRARY_PATH="$DIR_CLASSES:$DIR_LIB" #Variable LD_LIBRARY_PATH

export DIR_HOME DIR_LIB JAVA_HOME PATH CLASSPATH LD_LIBRARY_PATH

export LANG=es_MX.iso88591

#Ejecucion de comando
#sftp remedy@100.127.24.3:'/home/remedy/remedy_amx/ONBPAN_NITSM_USUARIOS_LDAP.xls /home/remedy/NominaTMP/CLARO\ PANAMA/ONBOARDING_ADM_USUARIOS_LDAP.xls'
vsResultado=`java -Xms128m -Xmx1024m  -Duser.timezone=Mexico/General -Dlog4j.configuration=file:"/webapps/Nominav2/WEB-INF/classes/log4j.xml" -Dfile.encoding=UTF-8  -Djava.ext.dirs="$DIR_LIB" com.mx.telcel.nomina.EnvioDatos "$*"`
echo $vsResultao
diff -c /home/remedy/NominaTMP/NominaCompleto.csv.old /home/remedy/NominaTMP/NominaCompleto.csv |egrep -v '^\*\*\*|^\-\-\-' >/home/remedy/NominaTMP/Diferencia.csv
cat  /home/remedy/NominaTMP/encabezado /home/remedy/NominaTMP/Diferencia.csv > /home/remedy/NominaTMP/BajasNomina.csv
diff -c /home/remedy/NominaTMP/Externos2ago.csv /home/remedy/NominaTMP/Externos3ago.csv |egrep -v '^\*\*\*|^\-\-\-' >/home/remedy/NominaTMP/ExternosTMP.csv
cat  /home/remedy/NominaTMP/encabezado /home/remedy/NominaTMP/ExternosTMP.csv > /home/remedy/NominaTMP/ExternosBajas.csv
vsResultadobaja=`java -Xms128m -Xmx1024m  -Duser.timezone=Mexico/General -Dlog4j.configuration=file:"/webapps/Nominav2/WEB-INF/classes/log4j.xml" -Dfile.encoding=UTF-8  -Djava.ext.dirs="$DIR_LIB" com.mx.telcel.bajas.BajasNomina "$*"`
echo $vsResultadobaja
#./SftpBajas
