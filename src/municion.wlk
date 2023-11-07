import wollok.game.*
import jugadores.*
import municion.*
import angulo.*
import direcciones.*
import sonidos.*
// definicion clase pelota
class Municion {

	var property position = game.origin() // devuelve (0,0)
	var anguloMunicion
	var evento = ""
	var colorMunicion
	var velocidad=40
	var sonidoEncendido = true
	var caracteresParaEvento = [1, 2, 3, 4,5, 6, 7, 8, 9, 10, 11, 12]
	
	method reproducirSonido () {disparoSonido.play()}
	method image() = "pelota.png"
	
	//method generarNombreEvento() = [ 1, 2, 3, 4 ].anyOne().toString() + [ 5, 6, 7, 8 ].anyOne().toString() + [ 9, 10, 11, 12 ].anyOne().toString()
	method generarNombreEvento() = caracteresParaEvento.anyOne().toString() + caracteresParaEvento.anyOne().toString() + caracteresParaEvento.toString()
	
	method angulo(nuevoAngulo) {
		anguloMunicion = nuevoAngulo
	}

	
	method evento(nuevoEvento) {
		evento = nuevoEvento
	}

	method iniciarMoviento() {
		self.movete()
		game.addVisual(self)
		if (sonidoEncendido) {self.reproducirSonido ()}
		evento = self.generarNombreEvento()
		game.onTick(velocidad, evento, { self.movete()})
	}

	method movete() {
		position = anguloMunicion.coordenada(position)
		self.controlarPosicionTablero()
	}

	method controlarPosicionTablero() { // controla la posicion de la municion y si llega a los bordes la elimina
		if (self.position().y() == -2 || self.position().y() == game.height()+1 || self.position().x() == -2 || self.position().x() == game.width()+1) 
		{
			self.quitar()
		} // lo metimos todo en un if solo, pq repetiamos logica con dos ifs
	}

	method quitar() {
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}

	method chocasteCon(jugador) {
	}

	method evento() = evento
	method activar(){}

}
class Pelota inherits Municion{
	
	override method image() = "pelota"+ colorMunicion.nombre() +".png"
	
	override method chocasteCon(jugador) {
		jugador.sufrirDanio(30)
		self.quitar()
	}
}

class Triangulos inherits Municion {

	override method image() = "triangulo"+ colorMunicion.nombre() +".png"
	override method reproducirSonido () {sierra.play()}
	override method chocasteCon(jugador) {
		jugador.sufrirDanio(60)
		self.quitar()
	}

}

class Bomba inherits Municion {
	var jugador = ""
	override method image() = "bombaMunicion"+ colorMunicion.nombre() +".png"
	override method reproducirSonido () {lanzamiento.play()}
	override method activar(){
		jugador.cambiarMunicion(0)
		//se puede hacer un remove list
		explosion.play()
		jugador.dispararTres(arriba,self.position())
		jugador.dispararTres(abajo,self.position())
		jugador.dispararTres(izquierda,self.position())
		jugador.dispararTres(derecha,self.position())
		jugador.dispararTres(arribaDerecha,self.position())
		jugador.dispararTres(arribaIzquierda,self.position())
		jugador.dispararTres(abajoIzquierda,self.position())
		jugador.dispararTres(abajoDerecha,self.position())
		
		self.quitar()
	}
	override method quitar(){
		jugador.cambiarMunicion(0)
		jugador.modoInterruptor(false)
		jugador.activarMunicion(false)
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}
	
}
class Aim inherits Municion {
	var jugador = ""
	override method image() = "aim"+ colorMunicion.nombre() +".png"
	
	override method activar(){
		teletransportacion.play()
		jugador.cambiarMunicion(0)
		jugador.cambiarPosicion(self.position())
		self.quitar()
	}
	override method quitar(){
		jugador.cambiarMunicion(0)
		jugador.modoInterruptor(false)
		jugador.activarMunicion(false)
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}
	
}
class Cometa inherits Municion {
	var patron
	override method image() = "cometa"+ colorMunicion.nombre() +".png"
	override method reproducirSonido () {}
	override method movete() {
		anguloMunicion = patron.anyOne()
		position = anguloMunicion.coordenada(position)
		self.controlarPosicionTablero()
	}
	override method chocasteCon(jugador) {
		jugador.sufrirDanio(50)
		self.quitar()
	}
	
}