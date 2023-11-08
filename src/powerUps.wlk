import wollok.game.*
import jugadores.*
import municion.*
import sonidos.*

class PowerUp{
	var property position = game.at((0..(game.width()-1)).anyOne() , (0..(game.height()-1)).anyOne())
	var usado = false
	method image() = ""

	method accion(jugador){}

	method quitar() {
		if(!usado){
			game.removeVisual(self)
		}
	}
	method chocasteCon(jugador){
		self.quitar()
		usado = true
		self.accion(jugador)
		powerUp.play()
	}
}

class Sierras inherits PowerUp{
	override method image() = "sierra.png"
	override method accion(jugador) {
		jugador.cambiarMunicion(sierras)
		game.schedule(5000,{jugador.cambiarMunicion(jugador.municionPorDefecto())})
	}
}

class Bombas inherits PowerUp{
	override method image() = "bomba.png"
	override method accion(jugador) {
		jugador.cambiarMunicion(new Bomba())
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
		jugador.cambiarMunicion(new Mira())
	} 
}