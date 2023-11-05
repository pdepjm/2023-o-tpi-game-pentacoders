import wollok.game.*
import jugadores.*
import municion.*
import angulo.*
import Ganador.*
import direcciones.*
import sonidos.*
import powerUps.*

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

	var cantidadJugadores

	method cantidadJugadores() = cantidadJugadores

	method iniciar() {
		if (menu.modoJugador()) {
			cantidadJugadores = 1
			self.unJugador()
		} else {
			cantidadJugadores = 2
			self.dosJugadores()
		}
		const fondo = game.sound("musicaFondo.mp3")
		fondo.shouldLoop(true)
		fondo.volume(0.5)
		fondo.play()
	}

	method setear() {
		game.width(25)
		game.height(10)
		game.cellSize(50)
		game.boardGround("fondo.jpg")
		game.title("PentaWarrior")
		self.menu()
		game.start()
	}

	method menu() {
		keyboard.up().onPressDo({ menu.cambiarModo()})
		keyboard.down().onPressDo({ menu.cambiarModo()})
		keyboard.enter().onPressDo({ game.removeVisual(menu)
			self.iniciar()
		})
		game.addVisual(menu)
	}

	method unJugador() {
		var jugador1 = new Jugador(numeroNave = "1", imagen = "Jugador1_derecha.png")
		jugador1.position(game.center().left(2))
		var enemigo = new Enemigo(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne()), numeroNave = "0", imagen = "enemigo.png")
		var enemigo2 = new Enemigo(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne()), numeroNave = "0", imagen = "enemigo.png")
		var enemigo3 = new Enemigo(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne()), numeroNave = "0", imagen = "enemigo.png")
		game.addVisual(enemigo)
		game.addVisual(enemigo2)
		game.addVisual(enemigo3)
		game.onTick(500, "disparar", { enemigo.dispararDos(izquierda)
			enemigo.dispararDos(derecha)
		})
		game.whenCollideDo(enemigo, { elemento => elemento.chocasteCon(enemigo)})
		game.whenCollideDo(enemigo2, { elemento => elemento.chocasteCon(enemigo2)})
		game.whenCollideDo(enemigo3, { elemento => elemento.chocasteCon(enemigo3)})
		game.onTick(500, "disparar", { enemigo2.dispararDos(arriba)
			enemigo.dispararDos(abajo)
		})
		game.onTick(500, "disparar", { enemigo3.dispararDos(izquierda)
			enemigo.dispararDos(derecha)
		})
		game.onTick(800, "movimiento", { enemigo.moverRamdon()})
		game.onTick(800, "movimiento", { enemigo2.moverRamdon()})
		game.onTick(800, "movimiento", { enemigo3.moverRamdon()})
			// movimiento jugador 1
		keyboard.up().onPressDo({ jugador1.mover(arriba)})
		keyboard.down().onPressDo({ jugador1.mover(abajo)})
		keyboard.left().onPressDo({ jugador1.mover(izquierda)})
		keyboard.right().onPressDo({ jugador1.mover(derecha)})
		keyboard.q().onPressDo({ jugador1.rotarA(antihorario)})
		keyboard.w().onPressDo({ jugador1.rotarA(horario)})
		keyboard.e().onPressDo({ jugador1.disparar()
			disparoSonido.play()
		})
		game.addVisual(jugador1)
		game.showAttributes(jugador1)
		game.whenCollideDo(jugador1, { elemento =>
			elemento.chocasteCon(jugador1)
			elemento.quitar()
		})
	}

	method dosJugadores() {
		var jugador1 = new Jugador(numeroNave = "1", imagen = "Jugador1_derecha.png")
		jugador1.position(game.center().left(2))
		keyboard.w().onPressDo({ jugador1.mover(arriba)})
		keyboard.a().onPressDo({ jugador1.mover(izquierda)})
		keyboard.s().onPressDo({ jugador1.mover(abajo)})
		keyboard.d().onPressDo({ jugador1.mover(derecha)})
		keyboard.e().onPressDo({ jugador1.rotarA(horario)})
		keyboard.q().onPressDo({ jugador1.rotarA(antihorario)})
		keyboard.r().onPressDo({ jugador1.disparar()
			disparoSonido.play()
		})
		game.addVisual(jugador1)
		game.showAttributes(jugador1)
		game.whenCollideDo(jugador1, { elemento => elemento.chocasteCon(jugador1)})
		
		var jugador2 = new Jugador(numeroNave = "2", imagen = "Jugador2_izquierda.png", contadorAngulo = 6, angulo = izquierda)
		jugador2.position(game.center().right(2))
		keyboard.o().onPressDo({ jugador2.rotarA(horario)})
		keyboard.i().onPressDo({ jugador2.rotarA(antihorario)})
		keyboard.up().onPressDo({ jugador2.mover(arriba)})
		keyboard.left().onPressDo({ jugador2.mover(izquierda)})
		keyboard.right().onPressDo({ jugador2.mover(derecha)})
		keyboard.down().onPressDo({ jugador2.mover(abajo)})

		keyboard.p().onPressDo({ jugador2.disparar()
			disparoSonido.play()
		})
		game.addVisual(jugador2)
		game.showAttributes(jugador2)
		game.whenCollideDo(jugador2, { elemento => elemento.chocasteCon(jugador2)})
		
	
		var enemigo = new Enemigo(numeroNave = "0", imagen = "enemigo.png")
		game.addVisual(enemigo)
		enemigo.hp(300)
		game.onTick(800, "bardear", { enemigo.descansar()})
		
		game.onTick(800, "movimiento", { enemigo.moverRamdon()})
		game.onTick(600, "disparar", { enemigo.dispararDos(izquierda) enemigo.dispararDos(derecha)}) 
		
		
		game.onTick(4000, "powerUps",{self.powerUpRamdon()})
		
		
	}
	method powerUpRamdon(){
		var triangulo = new Triangulo() 
		var vida = new Vida()
		var bomba = new Bombas()
		var portal = new Teletransportacion()
		var powerUp = [triangulo,vida,bomba,portal].anyOne()
		//var powerUp = portal
		game.addVisual(powerUp)
		game.schedule(3000,{powerUp.quitar()})
	}

}

object menu {

	var property position = game.at(4, 3)
	var imagen = "Menu 1.png"
	var modo = true
	var modoJugador = true

	method modoJugador() = modoJugador

	method image() = imagen

	method cambiarModo() {
		if (!modo) {
			self.dosJugadores()
		} else {
			self.unJugador()
		}
		modo = !modo
	}

	method unJugador() {
		imagen = "Menu 1.png"
		modoJugador = true
	}

	method dosJugadores() {
		imagen = "Menu 2.png"
		modoJugador = false
	}

}

