import wollok.game.*

object personaje {
    var property position = game.center()
    const property image = "fplayer.png"
	const property plantasCosechadas = []
	var property oro = 0

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
		plantasCosechadas.addAll(self.cultivosDeBajoParaCosechar())
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

	method venderAlimentos() {
		oro = oro + self.valorDeCultivos()
		plantasCosechadas.clear()
	}

	method valorDeCultivos() {
		return plantasCosechadas.sum({cultivo => cultivo.valorVenta()})
	}

	method decirOroYCultivos() {
		game.say(self, "Tengo" + oro.toString() + "de Oro y tengo" + plantasCosechadas.size().toString() + "plantas")
	}
}