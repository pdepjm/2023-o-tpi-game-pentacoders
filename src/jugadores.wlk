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
	var color 
	var sonido = true
	var caracteres 
	var municion = pelotas
	var municionPorDefecto = pelotas 
	
	method color()=color
	method sonido()=sonido
	method caracteres()=caracteres
	method municionPorDefecto()=municionPorDefecto
	
	method cambiarPosicion(posicion){
		if ( !( posicion.y() == -1 || posicion.y() == game.height() || posicion.x() == -1 || posicion.x() == game.width() ) )
		{
			position=posicion
		}
	}
	
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

	method cambiarMunicion(nuevaMunicion) {
		municion = nuevaMunicion
	}
	
	method disparar(){
		municion.iniciar(self)
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

	// VISUALES -- vida y nro jugador
	method text() = "                 " + hp.toString()

	method textColor() = color.texto()
	
	method chocasteCon(jugador){
		jugador.sufrirDanio(2)
		self.sufrirDanio(1)
	}

}

class Enemigo inherits Nave {
	method image() = imagen
	override method text() = "                        " + hp.toString()
	method moverRamdon() {
		const direcciones = [ arriba, abajo, izquierda, derecha ]
		self.mover(direcciones.anyOne())
	}
	override method  disparar(){
		if(!estaMuerto){
			municion.iniciar(self)
		}
	}
	method iniciar(){
		game.addVisual(self)
		self.hp(300)
		game.onTick(800, "burlarse", { self.burlarse()})
		game.onTick(800, "movimiento", { self.moverRamdon()})
		game.onTick(600, "disparar", { angulo = izquierda self.disparar() angulo = derecha self.disparar()}) 
	}

	override method sufrirDanio(danio) {
		hp -= danio
		if (hp <= 0) {
			game.removeTickEvent("burlarse")
			game.removeTickEvent("movimiento")
			game.removeTickEvent("disparar")
			estaMuerto = true
			self.quitar()
		}
	}
	
	method burlarse(){
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
			self.finalizar()
			//self.quitar()
			ganador.perdio(self)
		// juego.eliminarJugador(self)
		}
	}
	method iniciar(){
		game.addVisual(self)
		game.showAttributes(self)
		game.whenCollideDo(self, { elemento => elemento.chocasteCon(self)})
	}
	method finalizar(){
		game.whenCollideDo(self, {})
	}
}

