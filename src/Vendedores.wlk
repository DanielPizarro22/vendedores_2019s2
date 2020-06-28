import Geografia.*
class LopezYLopez{
	var property certificaciones = []
	const property esPersonaFisica = true
	
	method esVersatil(){
		return certificaciones.size() >= 3 and self.certificacionesMultiples()
	}
	method certificacionesMultiples(){
		return self.certificacionesDeProductos().size() >= 1 and self.certificacionesNoSonProductos().size() >= 1
	}
	
	method certificacionesDeProductos(){
		 return certificaciones.filter({prod => prod.esUnProducto()})
	}
	method certificacionesNoSonProductos(){
		return certificaciones.filter({prod =>  not prod.esUnProducto()})
	}
	
	method esFirme(){
		return self.puntajeTotalDeCertificaciones() >= 30
	}
	
	method puntajeTotalDeCertificaciones(){
		return certificaciones.sum({cert => cert.puntajeDeCertificacion()})
	}
	
}

class VendedorFijo inherits LopezYLopez{
	const property ciudadDondeVive
	
	method puedeTrabajarEn(ciudad){
		return ciudadDondeVive == ciudad
	}
	
	method esVendedorInfluyente(){
		return false
	}
	
	method tieneAfinidad(unCentro){
		return self.puedeTrabajarEn(unCentro.ciudadDeUbicacion())
	}
	
	method esCandidato(unCentro){
		return self.esVersatil() and self.tieneAfinidad(unCentro)
	}
}

class Viajante inherits LopezYLopez{
	var property provinciasHabilitadas = []
	
	method puedeTrabajarEn(ciudad){
		return self.estaEnProvinciaHabilitada(ciudad)
	}
	
	method estaEnProvinciaHabilitada(ciudad){
		return provinciasHabilitadas.contains(ciudad)
	}
	
	method esVendedorInfluyente(){
		return self.poblacionTotalDeLasProvincias() >= 10000 * 1000
	}
	
	method poblacionTotalDeLasProvincias(){
		return provinciasHabilitadas.sum({prov => prov.poblacion()})
	}
	method tieneAfinidad(unCentro){
		return self.puedeTrabajarEn(unCentro.ciudadDeUbicacion())
	}
	
	method esCandidato(unCentro){
		return self.esVersatil() and self.tieneAfinidad(unCentro)
	}
}


class ComercioCorresponsal inherits LopezYLopez{
	var property sucursales = []
	
	method puedeTrabajarEn(provincia){
		return self.tieneSucursalEn(provincia)
	}
	
	method tieneSucursalEn(provincia){
		return sucursales.contains(provincia)
	}
	
	method esVendedorInfluyente(){
		return sucursales.size() >= 5 or self.sucursalesDeProvincias().size() >= 3
	}
	method sucursalesDeProvincias(){
		return sucursales.map({ciudad => ciudad.provinciaEnDondeEsta()}).asSet()
	}
	method tieneAfinidad(unCentro){
		return self.puedeTrabajarEn(unCentro.ciudadDeUbicacion()) and self.unaSucursalPuedeCubrir(unCentro)
	}
	
	method unaSucursalPuedeCubrir(unCentro){
		return sucursales.any({ciudad => unCentro.puedeCubrir(ciudad)})
	}
	
	method esCandidato(unCentro){
		return self.esVersatil() and self.tieneAfinidad(unCentro)
	}
	override method esPersonaFisica(){
		return false
	}
}

