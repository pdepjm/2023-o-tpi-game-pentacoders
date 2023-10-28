import wollok.game.*
import municion.*
import angulo.*
import Ganador.*
import juego.*

class Nave {

	var property position = game.center()
	var imagen = "0.png"
	var hp = 500
	var angulo = 0
	
	method angulo() = angulo
	
	method hp() = hp

	method image() = imagen

	method cambiarImagen(nuevaImagen) {
		imagen = nuevaImagen + ".png"
	}
	
	
	/*method mover(direccion) {
		if ( !direccion.estaAlFinal() ){
			position = direccion.position() 
		}
		
	}*/
	
	method chocar() {	hp -= 20	}
 
	method moverDerecha() {
		if( !(self.position().x() == (game.width() - 1)) ){
			position = position.right(1)
		}
		else{
			game.say(self, "fin derecha jugador")
		}	
	}

	method moverIzquierda() {
		if( !(self.position().x() == 0) ){
			position = position.left(1)
		}
		else{
			game.say(self, "fin izquierda jugador")
		}
	}

	method moverArriba() {
		if( !(self.position().y() == (game.height() - 1)) ){
			position = position.up(1)
		}
		else{
			game.say(self, "fin arriba jugador")
		}
	}

	method moverAbajo() {
		if( !(self.position().y() == 0) ){
			position = position.down(1)
		}
		else{
			game.say(self, "fin abajo jugador")
		}
	}
	


	method rotarA(direccionDeRotacion){
		
		angulo = direccionDeRotacion.anguloCorroborado(self,angulo)
		self.cambiarImagen(angulo.toString()) 
	
	}
	
	
		

	
	method disparar() { // es un método del jugador porque la munición es del jugador
		var nombreEvento = [1,2,3,4].anyOne().toString() + [5,6,7,8].anyOne().toString() + [9,10,11,12].anyOne().toString()	//Para tener nombres diferente entre los objetos
		var municion = new Pelota(anguloPelota=angulo,evento=nombreEvento,position=self.position())

		municion.movete()
		game.addVisual(municion)
				
		game.onTick(40, nombreEvento, { municion.movete()})
	}


	method sufrirDanio(danio){
		hp -= danio
		if(hp<=0){
			self.quitar()
			
			//uego.eliminarJugador(self)
		}
		
	}
	
	method chocasteCon(jugador){
		self.sufrirDanio(15)
		jugador.sufrirDanio(25)
	}
	
	method soyMunicion() = false
	
	method quitar(){
		game.removeVisual(self)
	}
	//VIDA
	method text() = "                 " + hp.toString()
	method textColor() = "000000"
}


class Enemigo inherits Nave{
	//var vida = 100
	//var property position = game.center()	//devuelve (0,0)
	//var movimiento = [0,45,90,135,180,225,270,315]
	method image() = "pelota.png"
	
	
	


		
	
		
		
}	


class Jugador inherits Nave {
	
	var nombre = "0"
	
	override method sufrirDanio(danio){
		hp -= danio
		if(hp<=0){
			self.quitar()
			ganador.gano(nombre)
			//juego.eliminarJugador(self)
		}
		
		
	}
	
}



