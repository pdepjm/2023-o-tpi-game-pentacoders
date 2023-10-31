import wollok.game.*
import jugadores.*
import municion.*
import angulo.*
import Ganador.*
import direcciones.*
import sonidos.*

// implementar primera entrega como minimo:
// dos jugadores(listo)
// rotar en principio en 45 grados * 
// disparar, cambiar imagen * 
// mover jugador *
// al disparar y apuntar usar teclas distintas  *
// delegar en objetos cuando se apunta y dispara *
// conjunto chico de tests que se fije si anda disparar en una direccion *
// avisar tutores *
// mostrar la vida
// OPCIONAL:
// agregar enemigos
// pensar en agregar power ups para la segunda entrega
object juego {

	method iniciar() {
		game.width(25)
		game.height(10)
		game.cellSize(50)
		game.title("Juego Pentacoders")
			// var enemigo = new Enemigo()
		var jugador1 = new Jugador(numeroNave = "1", imagen = "Jugador1_0.png")
		jugador1.position(game.center().left(2))
		var jugador2 = new Jugador(numeroNave = "2", imagen = "Jugador2_180.png")
		var enemigo = new Enemigo(numeroNave = "0", imagen = "enemigo.png")
		jugador2.position(game.center().right(2))
		jugador2.rotarA(antihorario)
		jugador2.rotarA(antihorario)
		jugador2.rotarA(antihorario)
		jugador2.rotarA(antihorario)
			/*jugador2.rotarAIzquierda()
			 * jugador2.rotarAIzquierda()
			 * jugador2.rotarAIzquierda()
			 jugador2.rotarAIzquierda()*/
			// movimiento jugador 1
		keyboard.w().onPressDo({ jugador1.mover(arriba)})
		keyboard.a().onPressDo({ jugador1.mover(izquierda)})
		keyboard.s().onPressDo({ jugador1.mover(abajo)})
		keyboard.d().onPressDo({ jugador1.mover(derecha)})
		keyboard.e().onPressDo({ jugador1.rotarA(horario)})
		keyboard.q().onPressDo({ jugador1.rotarA(antihorario)})
			/*keyboard.e().onPressDo({ jugador1.rotarADerecha() })
			 keyboard.q().onPressDo({ jugador1.rotarAIzquierda() }) */
		keyboard.r().onPressDo({ jugador1.disparar()
			disparoSonido.play()
		})
			// movimiento jugador 2
		keyboard.o().onPressDo({ jugador2.rotarA(horario)})
		keyboard.p().onPressDo({ jugador2.rotarA(antihorario)})
			/*keyboard.o().onPressDo({ jugador2.rotarADerecha() })
			 keyboard.p().onPressDo({ jugador2.rotarAIzquierda() })*/
		keyboard.up().onPressDo({ jugador2.mover(arriba)})
		keyboard.left().onPressDo({ jugador2.mover(izquierda)})
		keyboard.down().onPressDo({ jugador2.mover(abajo)})
		keyboard.right().onPressDo({ jugador2.mover(derecha)})
			// const ganador = new ganador()
		keyboard.i().onPressDo({ jugador2.disparar()
			disparoSonido.play()
		})
			// game.onTick(500, "ganador", {  ganador.gano() })
		game.addVisual(jugador2)
		game.addVisual(jugador1)
		game.addVisual(enemigo)
		game.showAttributes(jugador2)
		game.showAttributes(jugador1)
		game.onTick(800, "movimiento", { enemigo.moverRamdon()})
		game.onTick(500, "disparar", { enemigo.disparar()})
		game.whenCollideDo(jugador2, { elemento =>
			elemento.chocasteCon(jugador2)
			elemento.quitar()
		})
		game.whenCollideDo(jugador1, { elemento =>
			elemento.chocasteCon(jugador1)
			elemento.quitar()
		})
		game.start()
	}

/*method eliminarJugador(jugador){
 * 	ganador.gano(jugador)
 }*/
}

