ScheduleAccount sc = new ScheduleAccount();

String segundo = String.valueOf(Datetime.now().second() + 10);
String minuto = String.valueOf(Datetime.now().minute());
String hora = String.valueOf(Datetime.now().hour());
String dia = String.valueOf(Datetime.now().day());

String tempo = segundo+' '+minuto+' '+hora+' '+dia+' * ?';
System.schedule('job teste integracao', tempo, sc);
