import wollok.game.*
import jugadores.*
import municion.*


// definicion clase pelota
class Pelota {

	var property position = game.origin()	//devuelve (0,0)
	var anguloPelota
	var evento

	method image() = "pelota.png"
	
	method angulo(nuevoAngulo){anguloPelota=nuevoAngulo}
	method evento(nuevoEvento){evento=nuevoEvento}

	method movete() {

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

		self.controlarPosicionTablero()
		
	}
	method controlarPosicionTablero(){
		if(self.position().y() == -2 || self.position().y() == game.height()+1){
			self.quitar()			
		}
		
		else if(self.position().x() == -2 || self.position().x() == game.width()){
			self.quitar()
		}
	}	
	method quitar(){
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}
	
	
	method soyMunicion() = true
	
	method chocasteCon(jugador){
		jugador.sufrirDanio(30)
	}
 
}

