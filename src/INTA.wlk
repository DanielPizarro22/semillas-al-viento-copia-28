object instNacionalDeTecAgrop {
	var property parcelas = []
	
	method promedioDePlantas(){
		return self.cantidadDePlantasPorParcela() / self.parcelas().size()
	}
	
	method cantidadDePlantasPorParcela(){
		return parcelas.sum({unaParcela => unaParcela.cantidadDePlantas()})
	}
	
	method parcelaMasAutoSustentable(){
		return self.parcelasConMasDe4Plantas().max({unaParcela=> unaParcela.cantidadDePlantasBienAsociadas()})
	}
	
	method parcelasConMasDe4Plantas(){
		return parcelas.filter({unaParcela => unaParcela.cantidadDePlantas() > 4})
	}
}
