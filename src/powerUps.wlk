import wollok.game.*
import jugadores.*
import municion.*

class PowerUp{
	var property position = game.at((0..(game.width()-1)).anyOne() , (0..(game.height()-1)).anyOne())
	var usado = false
	method image() = "manolo.png"

	method accion(jugador){}

	method quitar() {
		if(!usado){
			game.removeVisual(self)
		}
	}
	method chocasteCon(jugador){
		self.accion(jugador)
		self.quitar()
		usado = true
	}
}

class Triangulo inherits PowerUp{
	override method image() = "powerUp.png"
	override method accion(jugador) {
		jugador.cambiarMunicion(1)
		jugador.modoInterruptor(false)
		jugador.activarMunicion(false)
		game.schedule(5000,{jugador.cambiarMunicion(0)})
	}
}

class Bombas inherits PowerUp{
	override method image() = "bomba.png"
	override method accion(jugador) {
		jugador.cambiarMunicion(2)
		jugador.modoInterruptor(true)
		
	}
}

class Vida inherits PowerUp{
	override method image() = "vida.png" 
	override method accion(jugador) {
		jugador.recuperarVida(250)
	}
}

class Teletransportacion inherits PowerUp{
	override method image() = "portal.png"
	override method accion(jugador) {
		jugador.cambiarMunicion(3)
		jugador.modoInterruptor(true)
	} 
}