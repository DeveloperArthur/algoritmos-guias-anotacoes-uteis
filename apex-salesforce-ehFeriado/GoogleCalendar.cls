public class GoogleCalendar implements CalendarRepository {
    private String ENDPOINT = 'https://www.googleapis.com/calendar/v3/calendars/en.brazilian%23holiday%40group.v.calendar.google.com/events?key=';
    private String API_KEY = '123456';
    
    public FeriadoDto buscaFeriados(){
        HttpRequest requisicao = new HttpRequest();
        requisicao.setMethod('GET');
        requisicao.setEndpoint(ENDPOINT+API_KEY);
        
        HttpResponse resposta = new Http().send(requisicao);
        String json = resposta.getBody();
        String jsonTratado = json.replace('end', 'endDate').replace('date', 'data');
        
        FeriadoDto feriado = (FeriadoDto)System.JSON.deserialize(jsonTratado, FeriadoDto.class);
        return feriado;
    }
}
