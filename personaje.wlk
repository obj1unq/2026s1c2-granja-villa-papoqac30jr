import wollok.game.*

object personaje {
    var property position = game.center()
    const property image = "fplayer.png"
	const property plastasCosechadas = []

    method plantar(alimento) {
        game.addVisual(alimento)
    }

    method regar() {
    self.cultivosDeBajo().forEach({cultivo => cultivo.serRegado()})
    }

	method cultivosDeBajo() {
		const cultivos = game.colliders(self)
		if (cultivos.isEmpty()) {
			self.error("No hay cultivos acá")
		} else {
		return cultivos
	    }
	}

	method cosechar() {
		plastasCosechadas.addAll(self.cultivosDeBajoParaCosechar())
		self.cultivosDeBajoParaCosechar().forEach({cultivo => cultivo.serCosechado()})
	}

	method cultivosDeBajoParaCosechar() {
		const cultivos = self.cultivosParaCosechar()
		if (cultivos.isEmpty()) {
			self.error("No hay cultivos para cosechar aca")
		} else {
		return cultivos
	    }
	}

	method cultivosParaCosechar() {
		const cultivos = game.colliders(self)
		return cultivos.filter({cultivo => cultivo.puedeSerCosechado()})
	}
}