class Plantas {
	const property anioDeObtencion
	const property altura
	
	method toleranciaALSol(){
		return 7
	}
	method esFuerte(){
		return self.toleranciaALSol() > 9
	}
	
	method daNuevasSemillas(){
		return self.esFuerte()
	}
	
	method espacioQueOcupa()
}


class Menta inherits Plantas{
	
	override method daNuevasSemillas(){
		return super() or self.altura() > 0.4
	}
	
	override method espacioQueOcupa(){
		return self.altura() * 3
	}
	
	method leResultaIdeal(unaParcela){
		return unaParcela.superficieDeLaParcela() > 8
	}
}

class Soja inherits Plantas{
	override method toleranciaALSol(){
		if( altura < 0.3){ return 6}
		 else if(altura.between(0.3,0.8)){return 7}
		 	else{
				return 12		 	
		 }
	}
	
	override method daNuevasSemillas(){
		return super() or self.condicionAlternativa()
	}
	
	method condicionAlternativa(){
		return self.anioDeObtencion() > 2007 and self.altura().between(0.75,0.9)
	}
	
	override method espacioQueOcupa(){
		return self.altura() / 2
	}
	
	method leResultaIdeal(unaParcela){
		return unaParcela.horasDeSol() == self.toleranciaALSol()
	} 
}

class Quinoa inherits Plantas{
	const property espacioQueOcupa
	
	override method toleranciaALSol(){
		if (self.espacioQueOcupa() < 0.3){
			return 10
		}else{
			return super()
		}
	}
	
	override method daNuevasSemillas(){
		return super() or self.condicionAlternativa()
	}
	
	method condicionAlternativa(){
		return self.anioDeObtencion().between(2001,2008)
	}
	
	method leResultaIdeal(unaParcela){
		return unaParcela.ningunaPlantaSuperaLos(1.5)
	} 
	
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas(){
		return false
	}
	override method leResultaIdeal(unaParcela){
		return unaParcela.plantas().size() == 1
	}
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa(){
		return super() * 2
	}
}

