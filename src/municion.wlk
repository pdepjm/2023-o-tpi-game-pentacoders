import wollok.game.*
import jugadores.*
import municion.*

// definicion clase pelota
class Pelota {

	var property position = game.origin()

	method image() = "pelota.png"

	method movete(angulo , nombreEvento) {
		
		if (angulo.equals(0)) {
			position = position.right(1)
		} else if (angulo.equals(45)) {
			position = position.up(1).right(1)
		} else if (angulo.equals(90)) {
			position = position.up(1)
		} else if (angulo.equals(135)) {
			position = position.up(1).right(-1)
		} else if (angulo.equals(180)) {
			position = position.right(-1)
		} else if (angulo.equals(225)) {
			position = position.up(-1).right(-1)
		} else if (angulo.equals(270)) {
			position = position.up(-1)
		} else if (angulo.equals(315)) {
			position = position.up(-1).right(1)
		}

		if(self.position().y() == -1 || self.position().y() == game.height()){
		//if(self.position().y() == 0 || self.position().y() == game.height()-1){
			//game.say(jugador3, "final y")
			game.removeTickEvent(nombreEvento)
			game.removeVisual(self)
		}
		
		else if(self.position().x() == -1 || self.position().x() == game.width()){
		//else if(self.position().x() == 0 || self.position().x() == game.width()-1){ //para visualizar
			//game.say(jugador3, "final x")
			game.removeTickEvent(nombreEvento) 
			game.removeVisual(self)
		}
		
	}

}

object juego{//para iniciar el juego por consola
	method iniciar(){
		
		game.width(25)
		game.height(10)
		game.cellSize(50)
		
		
		game.title("Juego Pentacoders")
		//var jugador1 = new Jugador()
		
		var jugador2 = new Jugador()
		
		var jugador3 = new Jugador()
		
			// movimiento jugador 1
		keyboard.w().onPressDo({ jugador3.moverArriba() })
		keyboard.a().onPressDo({ jugador3.moverIzquierda() })
		keyboard.s().onPressDo({ jugador3.moverAbajo() })
		keyboard.d().onPressDo({ jugador3.moverDerecha() })
		keyboard.e().onPressDo({ jugador3.rotarADerecha() })
		keyboard.q().onPressDo({ jugador3.rotarAIzquierda() })
		keyboard.r().onPressDo({ jugador3.disparar() })
			// comportamiento municion
			// movimiento jugador 2


		keyboard.up().onPressDo({ jugador2.moverArriba() })
		keyboard.left().onPressDo({ jugador2.moverIzquierda() })
		keyboard.down().onPressDo({ jugador2.moverAbajo() })
		keyboard.right().onPressDo({ jugador2.moverDerecha() })
		keyboard.o().onPressDo({ jugador2.rotarADerecha() })
		keyboard.p().onPressDo({ jugador2.rotarAIzquierda() })
		keyboard.i().onPressDo({ jugador2.disparar() })
		game.addVisual(jugador2)		

		
			// keyboard.backspace().onPressDo({ game.say(jugador1, "JuegoPausado") })
		game.addVisual(jugador3)
		game.showAttributes(jugador3)

			// power up que te de trinagulols en vez de poelottias que den mas daño
			// cuando se presione la q y la e o cualquier secuancia parecida que implique rotar, cambia el sentido de la imagen y no se mueve
			// cuando la municion colisiona con algo, el jugadcor, con el que disparar, o la pared, o los enemigos, deberia desaparecer
		game.start()
		
		
		
		
	}
}

