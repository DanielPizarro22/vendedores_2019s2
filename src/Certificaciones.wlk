class Certificaciones {
	const property esUnProducto = false
	const property puntajeDeCertificacion = 0
}

class MarketinYVentas inherits Certificaciones{
	override method puntajeDeCertificacion(){
		return 8
	}
}

class VentaAmbulanteDeAlimentos inherits Certificaciones{
	override method esUnProducto(){
		return true
	}
	override method puntajeDeCertificacion(){
		return 15
	}
}

class GestionDeVentas inherits Certificaciones{
	override method puntajeDeCertificacion(){
		return 20
	}
}
	
class CertificadosDeElectrodomesticos inherits Certificaciones{
	
	override method esUnProducto(){
		return true
	}
	override method puntajeDeCertificacion(){
		return 15
	}
	
}
