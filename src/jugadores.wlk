import wollok.game.*
import municion.*

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

	method rotarADerecha() { // si se toca la e
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
		}
	}
	
	method soyMunicion() = false
	
	method quitar(){
		game.removeVisual(self)
	}


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


