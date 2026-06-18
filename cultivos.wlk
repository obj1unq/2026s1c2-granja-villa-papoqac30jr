import wollok.game.*

class Maiz {
    const property position = game.at(1, 1)
    var property estado = maizBebe

    method image() {
        // TODO: hacer que devuelva la imagen que corresponde
        return estado.imagen()
    }
   
    method serRegado() {
    estado = estado.crecer()
    }
	
	method serCosechado() {
		if (self.puedeSerCosechado()) {
			game.removeVisual(self)
		}
	}

	method puedeSerCosechado() {
		return estado.puedeSerCosechada()
	}
}
object maizBebe {
    method imagen() = "corn_baby.png"
    method crecer() = maizAdulto
	method puedeSerCosechada() = false
}

object maizAdulto {
    method imagen() = "corn_adult.png"
    method crecer() = self
	method puedeSerCosechada() = true
}

class Trigo {
    const property position = game.at(1 , 2)
    var property etapa = trigoNivel0

    method image() {
        // TODO: hacer que devuelva la imagen que corresponde
        return "wheat_" + etapa.imagen() + ".png"
    }

    method serRegado() {
    etapa = etapa.siguiente()
    }

	method serCosechado() {
		if (self.puedeSerCosechado()) {
			game.removeVisual(self)
		}
	}

	method puedeSerCosechado() {
		return etapa.puedeSerCosechada()
	}
}

object trigoNivel0 {
    method imagen() = "0"
    method siguiente() = trigoNivel1
	method puedeSerCosechada() = false
}

object trigoNivel1 {
   method imagen() = "1"
   method siguiente() = trigoNivel2
   method puedeSerCosechada() = false
}

object trigoNivel2 {
   method imagen() = "2"
   method siguiente() = trigoNivel3
   method puedeSerCosechada() = true
}

object trigoNivel3 {
    method imagen() = "3"
    method siguiente() = trigoNivel0
	method puedeSerCosechada() = true
}

class Tomaco {
	var property position = game.at(0 , 0)
    method image() {
        // TODO: hacer que devuelva la imagen que corresponde
        return "tomaco.png"
    }

	method serRegado() {
		position = game.at(self.position().x() , self.posicionParaArriba(self.position()))
	}

	method posicionParaArriba(posicion) {
		if (posicion.y() == 9) {
			return 0
		} else {
			return posicion.y() + 1
		}
	}

	method serCosechado() {
		game.removeVisual(self)
	}

	method puedeSerCosechado() = true
}