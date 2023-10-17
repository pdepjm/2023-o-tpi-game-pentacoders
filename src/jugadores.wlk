import wollok.game.*
import municion.*

class Jugador {

	var property position = game.center()
	var imagen = "0.png"
	var hp = 100
	var angulo = 0

	method image() = imagen

	method cambiarImagen(nuevaImagen) {
		imagen = nuevaImagen + ".png"
	}

	method moverDerecha() {
		position = position.right(1)
	}

	method moverIzquierda() {
		position = position.left(1)
	}

	method moverArriba() {
		position = position.up(1)
	}

	method moverAbajo() {
		position = position.down(1)
	}

	method rotarADerecha() { // si se toca la e
		angulo -= 45
		if (angulo.equals(-45)) {
			angulo = 315
		}
		self.cambiarImagen(angulo.toString())
	}

	method rotarAIzquierda() { // si se toca la q
		angulo += 45
		if (angulo.equals(360)) {
			angulo = 0
		}
		self.cambiarImagen(angulo.toString())
	}

	method disparar() {
		var municion = new Pelota()
		municion.position(position)
		municion.movete(angulo)
		game.addVisual(municion)
		game.onTick(100, "movimiento", { municion.movete(angulo)})
		game.schedule(1000, { game.removeVisual(municion)})
	}

}

