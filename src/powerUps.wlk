import wollok.game.*
import jugadores.*
import municion.*

class PowerUp{
	var property position = game.at((0..game.width()).anyOne() , (0..game.height()).anyOne())

	method image() = "powerUp.png"



	method quitar() {
		game.removeVisual(self)
	}


}

class Triangulo inherits PowerUp{
	
		method cambiarDisparo(jugador){
		jugador.cambiarBalas("Triangulo")
	}
	
}

class Vida inherits PowerUp{

	method curar(jugador){
		jugador.recuperarVida(250)
	}
}