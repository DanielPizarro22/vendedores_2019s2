class CentroDeDistribucion{
	const property ciudadDeUbicacion
	const vendedoresRegistrados = #{}
	
	method agregarVendedor(unVendedor){
		if (not vendedoresRegistrados.contains(unVendedor)){
			vendedoresRegistrados.add(unVendedor)
		}
		else{
			self.error("El vendedor ya se encuentra registrado.")
		}
	}
	
	method vendedorEstrella(){
		return vendedoresRegistrados.max({ unVendedor => unVendedor.puntajeTotalDeCertificaciones()})
	}
	
	method puedeCubrir(unaCiudad){
		return vendedoresRegistrados.any({unVendedor => unVendedor.puedeTrabajarEn(unaCiudad)})
	}
	
	
	method vendedoresGenericosRegistrados(){
		return vendedoresRegistrados.filter({unVendedor => unVendedor.certificacionesNoSonProductos().size() >= 1})
	}
	method esRobusto(){
		return self.vendedoresFirmesRegistrados().size() > 3
	}
	
	method vendedoresFirmesRegistrados(){
		return vendedoresRegistrados.filter({unVendedor => unVendedor.esFirme()})
	}

	method repartirCertificacion(unaCertificacion){
		vendedoresRegistrados.forEach({unVendedor => unVendedor.certificaciones([unaCertificacion])})
	}
}