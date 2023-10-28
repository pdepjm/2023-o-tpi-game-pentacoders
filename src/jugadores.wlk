import wollok.game.*
import municion.*
import angulo.*

class Jugador {

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
	
		method mover(direccion){
		if( ! direccion.estaAlFinal(position)  ){
		position = direccion.coordenada(position)
		}
		else {
			game.say(self, "fin tablero")
		}
				
		}
 
	method rotarA(direccionDeRotacion){
		
		angulo = direccionDeRotacion.anguloCorroborado(self,angulo)
		self.cambiarImagen(angulo.toString()) 
	
	}
	
	
		

	/*method rotarADerecha() { // si se toca la e
		angulo -= 45
		if (angulo.equals(-45)) {
			angulo = 315
		}
		self.cambiarImagen(angulo.toString())
	}

	method rotarAIzquierda() { // si se toca la q
		angulo += 45
		if (angulo.equals(360)) {
			angulo = 0
		}
		self.cambiarImagen(angulo.toString())
	}*/

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

/*
class Enemigo{
	var vida = 100
	var property position = game.center()	//devuelve (0,0)
		var movimiento = [0,45,90,135,180,225,270,315]
	method image() = "pelota.png"
	
		method disparar(angulo) { // es un método del jugador porque la munición es del jugador
		var nombreEvento = [1,2,3,4].anyOne().toString() + [5,6,7,8].anyOne().toString() + [9,10,11,12].anyOne().toString()	//Para tener nombres diferente entre los objetos
		var municion = new Pelota(anguloPelota=angulo,evento=nombreEvento,position=self.position())

		municion.movete()
		game.addVisual(municion)
				
		game.onTick(40, nombreEvento, { municion.movete()})
	}
	
	

	method movete() {
		var anguloPelota = movimiento.anyOne()
		
		if (anguloPelota.equals(0)) {
			position = position.right(1)
		} else if (anguloPelota.equals(45)) {
			position = position.up(1).right(1)
		} else if (anguloPelota.equals(90)) {
			position = position.up(1)
		} else if (anguloPelota.equals(135)) {
			position = position.up(1).right(-1)
		} else if (anguloPelota.equals(180)) {
			position = position.right(-1)
		} else if (anguloPelota.equals(225)) {
			position = position.up(-1).right(-1)
		} else if (anguloPelota.equals(270)) {
			position = position.up(-1)
		} else if (anguloPelota.equals(315)) {
			position = position.up(-1).right(1)
		}

		//self.controlarPosicionTablero()
		
	}	
}
*/

object arriba{
	method coordenada (posicion) = posicion.up(1)
	method estaAlFinal(posicion) = posicion.y() == (game.height() - 1)
}
object abajo{
	method coordenada (posicion) = posicion.down(1)
	method estaAlFinal(posicion) = posicion.y() == 0
}
object derecha{
	method coordenada (posicion) = posicion.right(1)
	method estaAlFinal(posicion) = posicion.x() == (game.width() - 1)
}
object izquierda{
	method coordenada (posicion) = posicion.left(1)
	method estaAlFinal(posicion) = posicion.x() == 0
}



