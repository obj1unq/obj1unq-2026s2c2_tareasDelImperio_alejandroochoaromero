import habitantes.*
class Tarea {
	method recursosProducidos(tiempo) {
		return self.calcularRecursosBase(tiempo)
	}

	method calcularRecursosBase(tiempo) {
		return 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo() }

	method desgaste(tiempo)
	method esfuerzo()
}

class Siembra inherits Tarea {
	var property esfuerzo = 0

	method jornadaMax()

	override method desgaste(tiempo) {
		const horasExtras = (tiempo - self.jornadaMax()).max(0)
		return 1 + horasExtras
	}

}

class SiembraEnValle inherits Siembra {
	var property epoca = epocaSeca

	override method jornadaMax() = 8

	override method recursosProducidos(tiempo) {
		return epoca.recursosProducidos(self, tiempo)
	}

		method epoca(_epoca) {
	        epoca = _epoca
	}
}

object epocaSeca {
	method recursosProducidos(siembra, tiempo) {
		return siembra.calcularRecursosBase(tiempo)
	}
}

object epocaDeLluvia {
	method recursosProducidos(siembra, tiempo) = 0
}

class SiembraEnTerrazas inherits Siembra {
	override method jornadaMax() = 6

	override method recursosProducidos(tiempo) {
		return super(tiempo) * 3
	}
}

class Mensaje inherits Tarea {
	override method esfuerzo() = 1.4

	override method desgaste(tiempo) {
		return tiempo / 4
	}
}

class MensajeImperial inherits Mensaje {
	override method esfuerzo() = 1.8

	override method desgaste(tiempo) {
		return (super(tiempo) - 2).max(1)
	}
}

class Colca {
	const property tareas = #{}

	method agregarTarea(tarea) {
		tareas.add(tarea)
	}

	method recursosTotales(habitante) {
		return tareas.sum({ t => habitante.recursosProducidos(t) })
	}

	method esSuave(habitante) {
		return tareas.any({ t => habitante.recursosProducidos(t) < 200 })
	}

	method tareaMasExigente(habitante) {
		return tareas.max({ t => habitante.recursosProducidos(t) })
	}
}

class Ayllu {
	const property colcas = #{}

	method agregarColca(colca) {
		colcas.add(colca)
	}

	method mejorColca(habitante) {
		return colcas.max({ c => c.recursosTotales(habitante) })
	}

	method colcasSuaves(habitante) {
		return colcas.filter({ c => c.esSuave(habitante) })
	}

	method tareasMasExigentes(habitante) {
		return colcas.map({ c => c.tareaMasExigente(habitante) }).asSet()
	}
}
