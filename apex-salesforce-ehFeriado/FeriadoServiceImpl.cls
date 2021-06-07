public class FeriadoServiceImpl implements FeriadoService {
    private CalendarRepository repository = RepositoryFactory.getCalendarRepository();
    
    public Boolean ehFeriado(Datetime dataDeHoje){
        FeriadoDto feriado = repository.buscaFeriados();
        
        for(ItemFeriado item : feriado.items){
            Datetime dataInicial = item.start.data;
            Datetime dataFinal = item.endDate.data;
            
            if(dataDeHoje >= dataInicial && dataDeHoje <= dataFinal){
                System.debug('Hoje eh feriado de '+item.summary);
                return true;
            }
        }
        
        return false;
    }
}