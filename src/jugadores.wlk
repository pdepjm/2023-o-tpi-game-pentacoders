import wollok.game.*
import municion.*
import angulo.*
import Ganador.*
import juego.*
import direcciones.*

class Nave {

	var property position = game.center()
	var imagen
	var hp = 500
	var angulo = derecha
	var contadorAngulo = 0
	var estaMuerto = false
	var numeroNave
	var balas = 0

	method angulo() = angulo

	method hp() = hp

	method recuperarVida(cantidad) {
		hp = (self.hp() + cantidad).min(500)
	}

	method image() = imagen

	method cambiarImagen(nuevoAngulo) {
		imagen = "Jugador" + numeroNave + "_" + nuevoAngulo + ".png"
	}

	method chocar() {
		hp -= 20
	}

	method cambiarBalas(bala) {
		balas = bala
	}

	method mover(direccion) {
		if (!direccion.estaAlFinal(position)) {
			position = direccion.coordenada(position)
		} else {
		}
	}

	method conseguirBala(anguloRecibido, eventoRecibido) {
		if (balas == 0) {
			return new Municion(anguloMunicion = anguloRecibido, evento = eventoRecibido, position = self.position())
		} else {
			return new Triangulos(anguloMunicion = anguloRecibido, evento = eventoRecibido, position = self.position())
		}
	}

	method rotarA(direccionDeRotacion) {
		angulo = direccionDeRotacion.anguloCorroborado(self, contadorAngulo)
		contadorAngulo = direccionDeRotacion.actualizarContador(contadorAngulo)
		self.cambiarImagen(angulo.toString())
	}

	method crearMunicion(anguloRecibido, nombreEvento) {
		var municion = self.conseguirBala(anguloRecibido, nombreEvento)
		municion.movete()
		game.addVisual(municion)
		game.onTick(40, nombreEvento, { municion.movete()})
		if (hp <= 0) {
			game.removeVisual(municion)
			game.removeTickEvent(municion.evento())
		}
	}

	method disparar() { // es un método del jugador porque la munición es del jugador
		var nombreEvento = [ 1, 2, 3, 4 ].anyOne().toString() + [ 5, 6, 7, 8 ].anyOne().toString() + [ 9, 10, 11, 12 ].anyOne().toString()
		self.crearMunicion(angulo, nombreEvento)
	}

	method sufrirDanio(danio) {
		hp -= danio
		if (hp <= 0) {
			self.quitar()
		}
	}

	method soyMunicion() = false

	method quitar() {
		game.removeVisual(self)
	}

	// VIDA
	method text() = "                 " + hp.toString()

	method textColor() = "000000"
	
	method chocasteCon(jugador){
			
		jugador.sufrirDanio(2)
		self.sufrirDanio(1)
		
		
	}

}

class Enemigo inherits Nave {

	// naves
	var vida = 100

	// var property position = game.center()	//devuelve (0,0)
	// var movimiento = [0,45,90,135,180,225,270,315]
	method image() = "enemigo.png"

	method moverRamdon() {
		const direcciones = [ arriba, abajo, izquierda, derecha ]
		self.mover(direcciones.anyOne())
	}

	method dispararDos(angulo2) { // es un método del jugador porque la munición es del jugador
		var nombreEvento = [ 1, 2, 3, 4 ].anyOne().toString() + [ 5, 6, 7, 8 ].anyOne().toString() + [ 9, 10, 11, 12 ].anyOne().toString()
		self.crearMunicion(angulo2, nombreEvento)
	}

	override method sufrirDanio(danio) {
		hp -= danio
		if (hp <= 0 && juego.cantidadJugadores() == 1) {
			self.quitar()
			ganador.gano(numeroNave)
		} else if (hp <= 0) {
			self.quitar()
		}
	}

}

class Jugador inherits Nave {

	override method sufrirDanio(danio) {
		hp -= danio
		if (hp <= 0) {
			self.quitar()
			ganador.gano(numeroNave)
		// juego.eliminarJugador(self)
		}
	}

}

