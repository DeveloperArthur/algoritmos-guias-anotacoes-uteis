/*Quando atualizamos a lista apenas com update lista, caso de algum erro em alguma iteração, 
é feito um rollback em toda a lista, para que isso nao aconteça, utilize o código abaixo, 
assim, mesmo que em alguma iteração de erro, as iterações anteriores que deram certo serão salvos*/

Database.update(lista, false);
