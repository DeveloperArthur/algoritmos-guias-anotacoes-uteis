public static Double calculaPercentualDeProgresso(Double inicio, Double fim, Double progressoAtual) {
        int intervalo = (int) (fim - inicio);
        int[] intervalosDeHospedagens = new int[intervalo + 1];

        int index = 0;
        for (int i = inicio.intValue(); i <= fim.intValue(); i++) {
            intervalosDeHospedagens[index] = i;
            index++;
        }

        int percentualDeProgresso = 0;
        for (int i = 0; i <= intervalo; i++) {
            if (progressoAtual == intervalosDeHospedagens[i]) {
                percentualDeProgresso = (i * 100) / intervalo;
            }
        }

        return Double.valueOf(percentualDeProgresso);
    }