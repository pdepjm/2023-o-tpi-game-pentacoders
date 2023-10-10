import wollok.game.*

object jugador1 {

	var property position = game.center()
	var imagen = "abajo"

	method image() = "jugador1/" + imagen + ".png"

	method cambiarImagen(nuevaImagen) {
		imagen = nuevaImagen
	}

	method moverDerecha() {
		position = position.right(1)
		self.cambiarImagen("derecha")
	}

	method moverIzquierda() {
		position = position.left(1)
		self.cambiarImagen("izquierda")
	}

	method moverArriba() {
		position = position.up(1)
		self.cambiarImagen("arriba")
	}

	method moverAbajo() {
		position = position.down(1)
		self.cambiarImagen("abajo")
	}

	method rotarADerecha() {
	}

	method rotarAIzquierda() {
	}

}

