class Parcela {
	var property ancho 
	var property largo
	var property horasDeSol
	var property plantas = []
	
	method superficieDeLaParcela(){
		return self.ancho() * self.largo()
	}
	
	method cantidadMaximaQueTolera(){
		return if(ancho > largo){ self.superficieDeLaParcela() / 5 }
					else{ self.superficieDeLaParcela() / 3 + largo }
	}
	
	method tieneComplicaciones(){
		return plantas.any({unaPlanta => unaPlanta.toleranciaALSol() < self.horasDeSol()})
	}
	
	method plantar(unaPlanta){
		if (not self.superaLaCantidadMaxima() or self.horasDeSol() < 2 ){
			plantas.add(unaPlanta)
		}else{
			self.error("Supera la cantidad maxima de plantas")
		}
	}
	method superaLaCantidadMaxima(){
		return self.cantidadDePlantas() >= self.cantidadMaximaQueTolera() 
	}
	
	method ningunaPlantaSuperaLos(metros){
		return plantas.all({unaPlanta => unaPlanta.altura() > metros })
	}
	
	method cantidadDePlantas(){
		return plantas.size()
	}
	
	method cantidadDePlantasBienAsociadas(){
		return plantas.count({unaPlanta => self.seAsociaBien(unaPlanta)})
	}
	method seAsociaBien(unaPlanta)
	
}

class ParcelasEcologicas inherits Parcela{
	override method seAsociaBien(unaPlanta){
		return not self.tieneComplicaciones() and unaPlanta.leResultaIdeal(self)
	}
}

class ParcelasIndustriales inherits Parcela{
	override method seAsociaBien(unaPlanta){
		return self.plantas().size() > 2 and unaPlanta.esFuerte()
	}
}