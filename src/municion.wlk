import wollok.game.*
import jugadores.*
import municion.*

// definicion clase pelota
class Municion {

	var property position = game.origin() // devuelve (0,0)
	var anguloMunicion
	var evento

	method image() = "pelota.png"

	method angulo(nuevoAngulo) {
		anguloMunicion = nuevoAngulo
	}

	method evento(nuevoEvento) {
		evento = nuevoEvento
	}

	method movimiento(angul) {
	}

	method mover() {
		position = anguloMunicion.movimiento(position)
	}

	method movete() {
		position = anguloMunicion.coordenada(position)
		self.controlarPosicionTablero()
	}

	method controlarPosicionTablero() { // controla la posicion de la municion y si llega a los bordes la elimina
		if (self.position().y() == -game.height() || self.position().y() == game.height() || self.position().x() == -game.width() || self.position().x() == game.width()) {
			self.quitar()
		} // lo metimos todo en un if solo, pq repetiamos logica con dos ifs
	}

	method quitar() {
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}

	method soyMunicion() = true

	method chocasteCon(jugador) {
		jugador.sufrirDanio(30)
		self.quitar()
	}

	method evento() = evento

}

class Triangulos inherits Municion {

	override method image() = "triangulo.png"

	override method chocasteCon(jugador) {
		jugador.sufrirDanio(60)
	}

}

