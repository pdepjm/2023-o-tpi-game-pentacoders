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
	method movimiento(angul){
		
	}


method mover(){
position = anguloMunicion.movimiento(position)
}


	method movete() {
		
		self.movimiento(anguloMunicion)
		if (anguloMunicion.equals(0)) {
			position = position.right(1)
		} else if (anguloMunicion.equals(45)) {
			position = position.up(1).right(1)
		} else if (anguloMunicion.equals(90)) {
			position = position.up(1)
		} else if (anguloMunicion.equals(135)) {
			position = position.up(1).right(-1)
		} else if (anguloMunicion.equals(180)) {
			position = position.right(-1)
		} else if (anguloMunicion.equals(225)) {
			position = position.up(-1).right(-1)
		} else if (anguloMunicion.equals(270)) {
			position = position.up(-1)
		} else if (anguloMunicion.equals(315)) {
			position = position.up(-1).right(1)
		}
		self.controlarPosicionTablero()
	}

	/*method mover(direccion){
	 * 	
	 * 	if( ! direccion.estaAlFinal(position)  ) {
	 * 		position = direccion.coordenada(position)
	 * 	}
	 * 	
	 * 	else {
	 * 		game.say(self, "fin tablero")
	 * 	}
	 * 			
	 }*/
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
	}

}
class Triangulo inherits Municion{
	
	override method image() = "triangulo.png"
	override method chocasteCon(jugador) {
		jugador.sufrirDanio(90)
	}
}



