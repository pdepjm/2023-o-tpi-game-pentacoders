import wollok.game.*
import jugadores.*
import municion.*

class Triangulo{
	var property position = game.center()

	method image() = "powerUp.png"


	method cambiarDisparo(jugador){
		jugador.cambiarBalas("Triangulo")
	}

		method quitar() {
		game.removeVisual(self)
	}


}