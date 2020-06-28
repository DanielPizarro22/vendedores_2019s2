class Clientes{
	method puedeSerAtentidoPor(unVendedor){
		return false
	}
}

class ClienteInseguro inherits Clientes{
	override method puedeSerAtentidoPor(unVendedor){
		return unVendedor.esVersatil() and unVendedor.esFirme()
	}
}

class ClienteDetallista inherits Clientes{
	override method puedeSerAtentidoPor(unVendedor){
		return unVendedor.certificacionesDeProductos().size() >= 3
	}
}

class ClienteHumanista inherits Clientes{
	override method puedeSerAtentidoPor(unVendedor){
		return unVendedor.esPersonaFisica()
	}
}