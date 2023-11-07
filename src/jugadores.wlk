import wollok.game.*
import municion.*
import angulo.*
import Ganador.*
import juego.*
import direcciones.*
import colores.*

class Nave {

	var property position = game.center()
	var imagen
	var hp = 500
	var angulo = derecha
	var contadorAngulo = 0
	var estaMuerto = false
	var numeroNave
	var municiones = 0
	var modoInterruptor = false
	var municionInterruptor = self.municionActual(angulo, self.position())
	var activarMunicion = false
	var color 
	var sonido = true
	method cambiarPosicion(posicion){
		if ( !( posicion.y() == -1 || posicion.y() == game.height() || posicion.x() == -1 || posicion.x() == game.width() ) )
		{
			position=posicion
		}
	}
	method modoInterruptor(modo) {modoInterruptor=modo}
	method activarMunicion(valor){activarMunicion=valor}
	
	method hp(vida){hp=vida}
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

	method mover(direccion) {
		if (!direccion.estaAlFinal(position)) {
			position = direccion.coordenada(position)
		} else {
		}
	}
	
//----------------------------
	method cambiarMunicion(municion) {
		municiones = municion
	}
	
	method municionActual(anguloRecibido, posicion) {

		if (municiones == 0) {
			return new Pelota(anguloMunicion = anguloRecibido, position = posicion,colorMunicion=color,sonidoEncendido = sonido)
		} 
		else if(municiones == 1) {
			return new Triangulos(anguloMunicion = anguloRecibido, position = posicion,colorMunicion=color)
		} 
		else if(municiones == 2){
			return new Bomba(anguloMunicion = anguloRecibido, position = posicion, jugador = self,colorMunicion=color)
		}
		else{
			return new Aim(anguloMunicion = anguloRecibido, position = posicion, jugador = self,colorMunicion=color)
		}
		
	}
	method crearMunicion(anguloRecibido, posicion) {
		var municion = self.municionActual(anguloRecibido, posicion)
		municion.iniciarMoviento()
		if (hp <= 0) {
			game.removeVisual(municion)
			game.removeTickEvent(municion.evento())
		}
	}
	
	method crearMunicionInterruptor(anguloRecibido, posicion){
		municionInterruptor = self.municionActual(anguloRecibido, posicion)
		municionInterruptor.iniciarMoviento()
	}
	/*
	method municionInterruptor(){
		
	}*/
	
	method disparar() { // es un método del jugador porque la munición es del jugador
	
		if(modoInterruptor){
			if(activarMunicion){
				municionInterruptor.activar()
				activarMunicion = false
				modoInterruptor = false
			}
			else{
				self.crearMunicionInterruptor(angulo, self.position())
				activarMunicion = true
			}
		}
		else{
			self.crearMunicion(angulo, self.position())
		}
	}
	
	method dispararDos(angulo2) { // es un método del jugador porque la munición es del jugador
		self.crearMunicion(angulo2,self.position())
	}
	
	method dispararTres(angulo2,posicionDisparo) { // es un método del jugador porque la munición es del jugador
		self.crearMunicion(angulo2,posicionDisparo)
	}
//----------------------------


	method rotarA(direccionDeRotacion) {
		angulo = direccionDeRotacion.anguloCorroborado(self, contadorAngulo)
		contadorAngulo = direccionDeRotacion.actualizarContador(contadorAngulo)
		self.cambiarImagen(angulo.toString())
	}

	method sufrirDanio(danio) {
		hp -= danio
		if (hp <= 0) {
			self.quitar()
		}
	}

	method quitar() {
		game.removeVisual(self)
	}

	// VIDA
	method text() = "                 " + hp.toString()

	method textColor() = color.texto()
	
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
	method image() = imagen

	method moverRamdon() {
		const direcciones = [ arriba, abajo, izquierda, derecha ]
		self.mover(direcciones.anyOne())
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
	method descansar(){
		var descansos = ["Hasta mi abuela juega mejor","Metanle onda que me duermo","Loco a ver si empiezan a jugar","Soy inmune a sus disparos :P","¿Es todo lo que tienen?"]
		game.say(self, descansos.anyOne())
		self.cambiarColor()
	}
	method cambiarColor(){
		color= [blanco,amarillo,verde,violeta,celeste].anyOne()
		imagen = "enemigo"+ color.nombre() +".png"
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

