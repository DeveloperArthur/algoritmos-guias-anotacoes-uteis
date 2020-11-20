private void verificaSeEstamosNoHorarioDeVerao() {
	if (estamosEntreNovembro() || estamoNoMeioDeFevereiro())
		retiraUmaHoraDevidoHorarioDeVerao();
}

private boolean estamosEntreNovembro() {
	int mesAtual = this.data.get(Calendar.MONTH);
	return mesAtual >= Calendar.NOVEMBER;
}

private boolean estamoNoMeioDeFevereiro() {
	int mesAtual = this.data.get(Calendar.MONTH);
	if (mesAtual == Calendar.FEBRUARY) {
		int diaAtual = this.data.get(Calendar.DAY_OF_MONTH);
		return diaAtual >= 20;
	}
	return false;
}

private void retiraUmaHoraDevidoHorarioDeVerao() {
	this.data.add(Calendar.HOUR_OF_DAY, -1);
}