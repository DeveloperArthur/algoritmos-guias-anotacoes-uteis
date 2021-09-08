({
	integraDoacao : function(component, event) {
		this.mostraLoading(component);
        
		const acao = component.get('c.envia');
        
        acao.setParams({
            idDaConta: component.get('v.recordId')
        });
        
        acao.setCallback(this, function(response){
            this.escondeLoading(component);
            
            if(response.getReturnValue()){
                this.mostraMensagem('success', ' ', 'Conta integrada com sucesso!');
            }else{
                this.mostraMensagem('error', 'Verifique nos Logs desta conta para mais detalhes', 'Ocorreu um erro ao integrar a conta');
            }
        });
        
        $A.enqueueAction(acao);
	},
    
    mostraLoading : function(component){
        component.set('v.loading', true);
    },
    
    escondeLoading : function(component){
        component.set('v.loading', false);
    },
    
    mostraMensagem : function(tipo, mensagem, titulo) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "type": tipo,
            "message": mensagem,
            "title": titulo 
        });
        toastEvent.fire();
    }
})