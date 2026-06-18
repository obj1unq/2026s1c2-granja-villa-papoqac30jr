import wollok.game.*

object personaje {
    var property position = game.center()
    const property image = "fplayer.png"

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

}