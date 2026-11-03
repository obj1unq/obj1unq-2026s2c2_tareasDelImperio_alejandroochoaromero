import imperio.*
class Habitante {
	var property energia = 100

	method tiempoDeTrabajo()
	method indiceResistencia()

	method recursosProducidos(tarea) {
		return tarea.recursosProducidos(self.tiempoDeTrabajo())
	}

	method energiaPerdida(tarea) {
		return self.recursosProducidos(tarea) / self.indiceResistencia()
	}

	method puedeRealizar(tarea) {
		return energia > self.energiaPerdida(tarea)
	}

	method realizarTarea(tarea) {
		if (self.puedeRealizar(tarea)) {
			energia = 0.max(energia - self.energiaPerdida(tarea))
		}
	}
}

class Campesino inherits Habitante {
	var property tiempoDeTrabajo = 4

	override method indiceResistencia() = 10
}

class Elite inherits Habitante {
	override method tiempoDeTrabajo() = 10

	override method indiceResistencia() = 12

	override method energiaPerdida(tarea) {
		return super(tarea) - 5
	}

	override method puedeRealizar(tarea) {
		return super(tarea) and self.recursosProducidos(tarea) > 500
	}
}