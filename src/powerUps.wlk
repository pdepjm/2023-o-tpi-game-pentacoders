import wollok.game.*
import jugadores.*
import municion.*

class PowerUp{
	var property position = game.center()

	method image() = "triangulo1.png"


	method cambiarDisparo(jugador){
		jugador.cambiarBalas("Triangulo")
	}

		method quitar() {
		game.removeVisual(self)
	}


}