package com.telcel.carga.control;

import com.infomedia.utils.PropertyLoader;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.read.biff.BiffException;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;


/*     */ public class EnvioDatos
/*     */ {
/*  37 */   public static final Properties prop = PropertyLoader.load("nomina1.properties");
            private final String rutaEA = prop.getProperty("RUTA_EA");
            private final String rutaEC = prop.getProperty("RUTA_EC");
            private final String rutaIB = prop.getProperty("RUTA_IB");
            private final String rutaIC = prop.getProperty("RUTA_IC");



/*     */   public String link()
/*     */   {
/* 111 */     Date fecha = new Date();
/* 112 */     StringBuilder[] urls = new StringBuilder[2];
/* 113 */     Calendar calendar = Calendar.getInstance();
/* 114 */     calendar.setTime(fecha);
/* 116 */     SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
              return sdf2.format(calendar.getTime()) + ".xls";
/*     */   }


    public void proceso(String ruta, int index) {

        try {
            WorkbookSettings configurar = new WorkbookSettings();
            configurar.setEncoding("iso-8859-1");

            Workbook existingWorkbook = Workbook.getWorkbook(new File(ruta), configurar);
            WritableWorkbook workbookCopy = Workbook.createWorkbook(new File(ruta), existingWorkbook);
            WritableSheet sheetToEdit = workbookCopy.getSheet(0);
            sheetToEdit.removeColumn(index);
            sheetToEdit.removeColumn(index);
            workbookCopy.write();
            workbookCopy.close();
            existingWorkbook.close();
            } catch (IOException | BiffException | WriteException ex) {
                Logger.getLogger(EnvioDatos.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
/*     */   public static void main(String[] args)
/*     */   {
/* 930 */     EnvioDatos envd = new EnvioDatos();
              String ruta1 = "";
              //eliminar columna 29 y la siguiente
              ruta1 = envd.rutaEA + envd.link();
              envd.proceso(ruta1, 29);
              
              System.out.println("=1");
              
              ruta1 = envd.rutaEC + envd.link();
              envd.proceso(ruta1, 29);
              
              System.out.println("=2");
              
              ruta1 = envd.rutaIB + envd.link();
              envd.proceso(ruta1, 14);
              
              System.out.println("=3");
              
              ruta1 = envd.rutaIC + envd.link();
              envd.proceso(ruta1, 29);
              
              System.out.println("=4\nOK");
/*     */   }
/*     */ }

