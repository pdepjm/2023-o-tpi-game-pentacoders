import wollok.game.*
import municion.*
import angulo.*
object ganador {
	var property position = game.origin()
	var imagen = "ganador.png"
	var participantes = []
	
	method participantes (listaDeParticipantes){participantes = listaDeParticipantes}
	method image() = imagen

	
	method perdio(perdedor){
		participantes.remove(perdedor)
		const ganador = participantes.anyOne()
		ganador.finalizar()
		game.clear()
		ganador.position(game.center().down(1))
		
		
		game.addVisual(self)
		game.addVisual(ganador)
		
		cometas.iniciar()
		game.say(ganador, "Gane")
		game.onTick(4000,"festejo",{ganador.rotarA(horario) self.efecto(ganador)})
		
	}
	method efecto(jugador){
		jugador.cambiarMunicion(new Bomba())
		jugador.disparar()
	}
}
