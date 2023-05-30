class NaveEspacial {
	var velocidad = 0
	var direccion = 0
	
	method acelerar(cuanto) {
		velocidad = (velocidad + cuanto).min(100000)
	}
	method desacelerar(cuanto) { 
		velocidad = 0.max(velocidad - cuanto)
	}
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { 
		direccion = 10.min(direccion + 1)
	}
	method alejarseUnPocoDelSol() {
		direccion = -10.max(direccion - 1)
	}
	method prepararViaje() {}
}

class NaveBaliza inherits NaveEspacial {
	var colorDeBaliza //No es property porque me dicen explícitamente cómo se tiene que llamar el setter
	
	method cambiarColorDeBaliza(colorNuevo) {
		colorDeBaliza = colorNuevo
	}
	method colorDeBaliza() = colorDeBaliza
	
	override method prepararViaje() {
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
	}
}

class NaveDePasajeros inherits NaveEspacial {
	const property cantidadDePasajeros
	var racionesDeComida
	var racionesDeBebida
	
	method cargarRacionesDeComida(cantidad) {
		racionesDeComida += cantidad
	}
	method cargarRacionesDeBebida(cantidad) {
		racionesDeBebida += cantidad
	}
	method descargarRacionesDeComida(cantidad) {
		racionesDeComida = 0.max(racionesDeComida - cantidad)
	}
	method descargarRacionesDeBebida(cantidad) {
		racionesDeBebida = 0.max(racionesDeBebida - cantidad)
	}
	method racionesDeComida() = racionesDeComida
	method racionesDeBebida() = racionesDeBebida
}

class NaveDeCombate inherits NaveEspacial {
	var estaInvisible = false
	var misilesDesplegados = false
	const property mensajesEmitidos = []
	
	method estaInvisible() = estaInvisible
	method ponerVisible() {
		estaInvisible = false
	}
	method ponerInvisible() {
		estaInvisible = true
	}
	method deplegarMisiles() {
		misilesDesplegados = true
	}
	method replegarMisiles() {
		misilesDesplegados = false
	}
	method emitirMensaje(mensaje) {
		mensajesEmitidos.add(mensaje)
	}
	method primerMensajeEmitido() {
		if(mensajesEmitidos.isEmpty()) self.error("No emitio ningun mensaje")
		return mensajesEmitidos.first()
		}
	method ultimoMensajeEmitido() {
		if(mensajesEmitidos.isEmpty()) self.error("No emitio ningun mensaje")
		return mensajesEmitidos.least()
	} 
	method esEscueta() = mensajesEmitidos.all({mensaje => mensaje.size() <= 30})
	method emitioMensaje(mensaje) = mensajesEmitidos.contains(mensaje)
}











