import wollok.game.*

object jugador1 {

	var property position = game.center()
	var imagen = "abajo"
	var property municion = pelota
	var hp = 100

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

	method rotarADerecha() { // si se toca la e
	// tenemos que cargar el opuesto
	}

	method rotarAIzquierda() { // si se toca la q
	}

	method disparar() {
		// game.addVisual(self.municion())
		game.addVisualCharacterIn(self.municion(), self.position())
		game.onTick(2000, "movimiento", { self.municion().movete()})
	}

}

object jugador2 {

	var property position = game.origin()
	var imagen = "abajo"
	var property municion = pelota
	var hp = 100

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

	method disparar() {
		game.addVisual(self.municion())
		game.addVisualCharacterIn(self.municion(), position)
		game.onTick(2000, "movimiento", { self.municion().movete()})
	}

}

//despues pasar a otro archivo wollok, genera una pelota(al ser un objeto) que se mueve en random(modificar para comportarlo como disparos)
object pelota {

	var property position = game.origin()

	method image() = "bala.png"

	method movete() {
		self.position(position.right(1))
		const x = 0.randomUpTo(game.width()).truncate(0)
		const y = 0.randomUpTo(game.height()).truncate(0)
		position = game.at(x, y)
	}

}

