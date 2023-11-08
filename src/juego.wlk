import wollok.game.*
import jugadores.*
import municion.*
import angulo.*
import Ganador.*
import direcciones.*
import sonidos.*
import powerUps.*
import colores.*



object juego {
	
	method iniciar(modoDeJuego) {
		modoDeJuego.iniciar()
		musicaFondo.play()	
	}

	method setear() {
		game.width(23)
		game.height(12)
		game.cellSize(50)
		game.boardGround("fondo.png")
		game.title("PentaWarriors")
		self.menu()		
	}
	method setearMenu(){
		keyboard.up().onPressDo({ menu.cambiarModo() sonidoMenu.play()} )
		keyboard.down().onPressDo({ menu.cambiarModo() sonidoMenu.play()})
		keyboard.enter().onPressDo({ sonidoMenu.play() game.removeVisual(menu)
			game.clear()musicaMenu.stop() self.iniciar(menu.modoJugador()) 
		})
		game.addVisual(menu)
		cometas.iniciar()
	}
	method menu() {		
		self.setearMenu()
		game.schedule(20, { musicaMenu.play()} )
		game.start() 

	}
	method menuReset() {		
		self.setearMenu()
		musicaMenu.play()

	}
}

object entrenamiento{
	
	method iniciar() {
		powerUps.iniciar()

		//var cometa = Cometa (anguloMunicion = arriba, position = game.center(),colorMunicion=amarillo)
		//	Cometa.iniciarMoviento()
		/*
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
		})*/
		keyboard.backspace().onPressDo({ game.clear() musicaFondo.stop() juego.menuReset()})
	}
}

object dosJugadores{
	method iniciar() {
		var jugador1 = new Jugador(numeroNave = "1", imagen = "Jugador1_derecha.png", contadorAngulo = 2,color = verde, caracteres = [1, 2, 3, 4,5, 6, 7, 8, 9, 10, 11, 12])
		jugador1.position(game.center().left(7))
		keyboard.w().onPressDo({ jugador1.mover(arriba)})
		keyboard.a().onPressDo({ jugador1.mover(izquierda)})
		keyboard.s().onPressDo({ jugador1.mover(abajo)})
		keyboard.d().onPressDo({ jugador1.mover(derecha)})
		keyboard.e().onPressDo({ jugador1.rotarA(horario)})
		keyboard.q().onPressDo({ jugador1.rotarA(antihorario)})
		keyboard.r().onPressDo({ jugador1.disparar()})
		jugador1.iniciar()
				
		var jugador2 = new Jugador(numeroNave = "2", imagen = "Jugador2_izquierda.png", contadorAngulo = 6, angulo = izquierda,color = amarillo,caracteres = [13, 14, 15, 16,17, 18, 19, 20, 21, 22, 23, 23])
		jugador2.position(game.center().right(7))
		keyboard.o().onPressDo({ jugador2.rotarA(horario)})
		keyboard.i().onPressDo({ jugador2.rotarA(antihorario)})
		keyboard.up().onPressDo({ jugador2.mover(arriba)})
		keyboard.left().onPressDo({ jugador2.mover(izquierda)})
		keyboard.right().onPressDo({ jugador2.mover(derecha)})
		keyboard.down().onPressDo({ jugador2.mover(abajo)})
		keyboard.p().onPressDo({ jugador2.disparar()})
		jugador2.iniciar()
		
	
		var enemigo = new Enemigo(numeroNave = "0", imagen = "enemigoBlanco.png",color = blanco,sonido=false,caracteres = ["h","i","j","k","l","ll","m","n","o","p","q","r"])
		enemigo.iniciar()
		
		powerUps.iniciar()
		cometas.iniciar()
		ganador.participantes([jugador1,jugador2])
		game.schedule(20000,{game.clear() self.iniciar()}) //terminar
		
		keyboard.backspace().onPressDo({ game.clear() musicaFondo.stop() juego.menuReset()})
	}
}

object menu {

	var property position = game.origin()
	var imagen = "Menu 1.png"
	var modo = true // true es para entrenamiento, false para dos jugadores
	var modoJugador = entrenamiento

	method modoJugador() = modoJugador

	method image() = imagen

	method cambiarModo() {
		modo = !modo
		if (!modo) {
			self.dosJugadores()
			modoJugador=dosJugadores
		} else {
			self.entrenamiento()
			modoJugador=entrenamiento
		}
	}

	method entrenamiento() {
		imagen = "Menu 1.png"
	}

	method dosJugadores() {
		imagen = "Menu 2.png"
	}

}
object powerUps {
	
	method iniciar(){game.onTick(4000, "powerUps",{self.powerUpRamdon()}) }
	
	method powerUpRamdon(){
		var sierra = new Sierras() 
		var vida = new Vida()
		var bomba = new Bombas()
		var portal = new Teletransportacion()
		var powerUp = [sierra,vida,bomba,portal].anyOne()
		game.addVisual(powerUp)
		game.schedule(3000,{powerUp.quitar()})
	}
}

