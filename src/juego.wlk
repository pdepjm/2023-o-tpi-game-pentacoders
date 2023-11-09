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
			game.clear()musicaMenu.stop()self.iniciar(menu.modoJugador()) 
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
	method setearJugador1(jugador1){
		keyboard.w().onPressDo({ jugador1.mover(arriba)})
		keyboard.a().onPressDo({ jugador1.mover(izquierda)})
		keyboard.s().onPressDo({ jugador1.mover(abajo)})
		keyboard.d().onPressDo({ jugador1.mover(derecha)})
		keyboard.e().onPressDo({ jugador1.rotarA(horario)})
		keyboard.q().onPressDo({ jugador1.rotarA(antihorario)})
		keyboard.space().onPressDo({ jugador1.disparar()})
		jugador1.iniciar()
	}
	method setearJugador2(jugador2){
		keyboard.o().onPressDo({ jugador2.rotarA(horario)})
		keyboard.i().onPressDo({ jugador2.rotarA(antihorario)})
		keyboard.up().onPressDo({ jugador2.mover(arriba)})
		keyboard.left().onPressDo({ jugador2.mover(izquierda)})
		keyboard.right().onPressDo({ jugador2.mover(derecha)})
		keyboard.down().onPressDo({ jugador2.mover(abajo)})
		keyboard.p().onPressDo({ jugador2.disparar()})
		jugador2.iniciar()
	}
	
}

object entrenamiento{
	method imagen() = "Menu 1.png"
	
	method iniciar() {
		powerUps.iniciar()

		var jugador1 = new Jugador(imagen = "Jugador1_derecha.png",imagenJugador = "Jugador1",color = verde, caracteres = [1, 2, 3, 4,5, 6, 7, 8, 9, 10, 11, 12])
		juego.setearJugador1(jugador1)
		
		var enemigo = new Enemigo(imagenJugador = "enemigoBlanco.png",color = blanco,sonido=false,caracteres = ["h","i","j","k","l","ll","m","n","o","p","q","r"])
		enemigo.iniciar()

		game.whenCollideDo(enemigo, { elemento => elemento.chocasteCon(enemigo)})

		keyboard.backspace().onPressDo({ game.clear() musicaFondo.stop() juego.menuReset()})
	}
}

object dosJugadores{
	method imagen() = "Menu 2.png"
	method iniciar() {
		var jugador1 = new Jugador(imagen = "Jugador1_derecha.png",imagenJugador = "Jugador1", contadorAngulo = 2,color = verde, caracteres = [1, 2, 3, 4,5, 6, 7, 8, 9, 10, 11, 12])
		jugador1.position(game.center().left(7))
		juego.setearJugador1(jugador1)
				
		var jugador2 = new Jugador(imagen = "Jugador2_izquierda.png",imagenJugador = "Jugador2", contadorAngulo = 6, angulo = izquierda,color = amarillo,caracteres = [13, 14, 15, 16,17, 18, 19, 20, 21, 22, 23, 23])
		jugador2.position(game.center().right(7))
		juego.setearJugador2(jugador2)
		
	
		var enemigo = new Enemigo(imagen = "enemigoBlanco.png",imagenJugador = "enemigoBlanco.png",color = blanco,sonido=false,caracteres = ["h","i","j","k","l","ll","m","n","o","p","q","r"])
		enemigo.iniciar()
		
		powerUps.iniciar()
		cometas.iniciar()
		ganador.participantes([jugador1,jugador2])
		game.schedule(25000,{game.clear() self.invertirPosiciones(jugador1,jugador2,enemigo)}) //terminar
		
		keyboard.backspace().onPressDo({ game.clear() musicaFondo.stop() juego.menuReset()})
	}
	method invertirPosiciones(jugador1,jugador2,enemigo){
		var posicionJugador2 = jugador2.position()
		var anguloJugador2 = jugador2.angulo()
		var contadorAnguloJugador2 = jugador2.contadorAngulo()
		
		jugador2.position(jugador1.position())
		jugador2.contadorAngulo(jugador1.contadorAngulo())
		jugador2.angulo(jugador1.angulo())
		jugador2.cambiarImagen(jugador1.angulo())
		
		jugador1.position(posicionJugador2)
		jugador1.contadorAngulo(contadorAnguloJugador2)
		jugador1.angulo(anguloJugador2)
		jugador1.cambiarImagen(anguloJugador2)
		
		juego.setearJugador1(jugador1)
		juego.setearJugador2(jugador2)
		keyboard.backspace().onPressDo({ game.clear() musicaFondo.stop() juego.menuReset()})
		game.schedule(25000,{game.clear() self.invertirPosiciones(jugador1,jugador2,enemigo)})
		
		enemigo.iniciar()
		powerUps.iniciar()
		cometas.iniciar()
	}
}

object menu {

	var property position = game.origin()
	var imagen = "Menu 2.png"
	var modoJugador = dosJugadores

	method modoJugador() = modoJugador

	method image() = imagen

	method cambiarModo() { 
		if(modoJugador == entrenamiento)
			modoJugador = dosJugadores
		else
		 	modoJugador = entrenamiento
			imagen =  modoJugador.imagen()
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

