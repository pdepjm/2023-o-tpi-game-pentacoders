import wollok.game.*
import jugadores.*
import municion.*
import angulo.*

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
		method iniciar(){
		game.width(25)
		game.height(10)
		game.cellSize(50)
		
		game.title("Juego Pentacoders")

		
	//	var enemigo = new Enemigo()
		
		var jugador3 = new Jugador()
		jugador3.position(game.center().left(2))
		
		var jugador2 = new Jugador()
		
		jugador2.position(game.center().right(2))
		jugador2.rotarA(izquierda)
		jugador2.rotarA(izquierda)
		jugador2.rotarA(izquierda)
		jugador2.rotarA(izquierda)
		
		/*jugador2.rotarAIzquierda()
		jugador2.rotarAIzquierda()
		* jugador2.rotarAIzquierda()
		jugador2.rotarAIzquierda()*/
	
		
		// movimiento jugador 1
		keyboard.w().onPressDo({ jugador3.moverArriba() })
		keyboard.a().onPressDo({ jugador3.moverIzquierda() })
		keyboard.s().onPressDo({ jugador3.moverAbajo() })
		keyboard.d().onPressDo({ jugador3.moverDerecha() })
		
		keyboard.e().onPressDo({ jugador3.rotarA(derecha) })
		keyboard.q().onPressDo({ jugador3.rotarA(izquierda) })
		
		/*keyboard.e().onPressDo({ jugador3.rotarADerecha() })
		keyboard.q().onPressDo({ jugador3.rotarAIzquierda() }) */
		keyboard.r().onPressDo({ jugador3.disparar() })
		
		// movimiento jugador 2
		
		
		keyboard.o().onPressDo({ jugador2.rotarA(derecha) })
		keyboard.p().onPressDo({ jugador2.rotarA(izquierda) })
		
		/*keyboard.o().onPressDo({ jugador2.rotarADerecha() })
		keyboard.p().onPressDo({ jugador2.rotarAIzquierda() })*/
		
		
		keyboard.up().onPressDo({ jugador2.moverArriba() })
		keyboard.left().onPressDo({ jugador2.moverIzquierda() })
		keyboard.down().onPressDo({ jugador2.moverAbajo() })
		keyboard.right().onPressDo({ jugador2.moverDerecha() })

		
		
		
		keyboard.i().onPressDo({ jugador2.disparar() })
		
		
		
		game.addVisual(jugador2)	
		game.addVisual(jugador3)
	//	game.addVisual(enemigo)
		
		game.showAttributes(jugador2)
		game.showAttributes(jugador3)
		
		
		
	//	game.onTick(900, "movimiento", { enemigo.movete() })
	//	game.onTick(500, "disparar", { enemigo.disparar(90) })
	//	game.onTick(520, "disparar", { enemigo.disparar(180) })
	//	game.onTick(540, "disparar", { enemigo.disparar(270) })
		
		
		
		
		game.whenCollideDo(jugador2, { elemento => 
			elemento.chocasteCon(jugador2)
			elemento.quitar()
		})
				
    	game.whenCollideDo(jugador3, { elemento => 
    		elemento.chocasteCon(jugador3)
    		elemento.quitar()			
		})
    	
		game.start()

		}
}
