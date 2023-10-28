import wollok.game.*

object ganador {
	
	var imagen = "0.png"
	
	var property position = game.at(0,0)
	
	method image() = imagen
	
	method gano(nombreGanador){
		game.clear()
		
		if(nombreGanador == "1"){
			imagen = "jugador1Ganador.png"	
		}
		else {
			imagen = "jugador2Ganador.png"
		}
		
		game.addVisual(self)
		
	}
	
}
