import wollok.game.*
import jugadores.*
import municion.*

class Triangulo{
	var property position = game.at((0..game.width()).anyOne() , (0..game.height()).anyOne())

	method image() = "powerUp.png"


	method cambiarDisparo(jugador){
		jugador.cambiarBalas("Triangulo")
	}

		method quitar() {
		game.removeVisual(self)
	}


}