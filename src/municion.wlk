import wollok.game.*
import jugadores.*
import municion.*
import angulo.*
import direcciones.*
import sonidos.*
import colores.*
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
	
	method generarNombreEvento() = (caracteresParaEvento.anyOne().toString() )+ (caracteresParaEvento.anyOne().toString()) + (caracteresParaEvento.anyOne().toString())
	
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
		self.quitar()
		jugador.sufrirDanio(30)
	}
}

class Sierra inherits Municion {

	override method image() = "sierra"+ colorMunicion.nombre() +".png"
	override method reproducirSonido () {sierra.play()}
	override method chocasteCon(jugador) {
		self.quitar()
		jugador.sufrirDanio(60)
	}
}
class SuperPelota inherits Municion {
	var jugador1
	override method image() = "bombaMunicion"+ colorMunicion.nombre() +".png"
	override method reproducirSonido () {lanzamiento.play()}

	override method quitar(){
		jugador1.cambiarMunicion(jugador1.municionPorDefecto())
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}
}

class Aim inherits Municion {
	var jugador1
	override method image() = "aim"+ colorMunicion.nombre() +".png"
	override method quitar(){
		jugador1.cambiarMunicion(jugador1.municionPorDefecto())
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
object pelotas{
	method iniciar(jugador){
		var pelota = new Pelota (anguloMunicion = jugador.angulo(),position = jugador.position(),colorMunicion=jugador.color(),sonidoEncendido = jugador.sonido(),caracteresParaEvento=jugador.caracteres())
		pelota.iniciarMoviento()
	}
	method iniciar2(jugador,posicion,angulo){
		var pelota = new Pelota (anguloMunicion = angulo,position = posicion,colorMunicion=jugador.color(),sonidoEncendido = jugador.sonido(),caracteresParaEvento=jugador.caracteres())
		pelota.iniciarMoviento()
	}
}
object sierras{
	method iniciar(jugador){
		var sierras = new Sierra (anguloMunicion = jugador.angulo(),position = jugador.position(),colorMunicion=jugador.color(),sonidoEncendido = jugador.sonido(),caracteresParaEvento=jugador.caracteres())
		sierras.iniciarMoviento()
	}
}

object cometas{
	
	method iniciar(){
		game.onTick(2000, "cometa",{self.crear()})
	}
	method crear(){
		var posicion = game.at((0..(game.width()-1)).anyOne() , (0..(game.height()-1)).anyOne())
		var colores = [amarillo,verde,violeta,celeste]
		var patrones = [[arriba,izquierda,arribaIzquierda],[abajo,izquierda,abajoIzquierda],[arriba,derecha,arribaDerecha],[abajo,derecha,abajoDerecha]]
		var cometa = new Cometa(anguloMunicion = arriba, position = posicion,colorMunicion=colores.anyOne(),velocidad=100,patron=patrones.anyOne(),caracteresParaEvento = ["a","b","c","d","e","f","g"])
		cometa.iniciarMoviento()
	}
}


class Bomba{
var explotar = false	
var superPelota = pelotas
	method iniciar(jugador){
		if(!explotar){
		superPelota = new SuperPelota (anguloMunicion = jugador.angulo(),position = jugador.position(),colorMunicion=jugador.color(),sonidoEncendido = jugador.sonido(),caracteresParaEvento=jugador.caracteres(),jugador1=jugador)
		superPelota.iniciarMoviento()
		explotar = true
		}
		else{
			explosion.play()
			pelotas.iniciar2(jugador,superPelota.position(),arriba)
			pelotas.iniciar2(jugador,superPelota.position(),abajo)
			pelotas.iniciar2(jugador,superPelota.position(),izquierda)
			pelotas.iniciar2(jugador,superPelota.position(),derecha)
			pelotas.iniciar2(jugador,superPelota.position(),arribaDerecha)
			pelotas.iniciar2(jugador,superPelota.position(),arribaIzquierda)
			pelotas.iniciar2(jugador,superPelota.position(),abajoIzquierda)
			pelotas.iniciar2(jugador,superPelota.position(),abajoDerecha)
			jugador.cambiarMunicion(jugador.municionPorDefecto())
			superPelota.quitar()
		}
	}
}


class Mira{
var teletransportarse = false	
var objetivo = pelotas
	method iniciar(jugador){
		if(!teletransportarse){
		objetivo = new Aim (anguloMunicion = jugador.angulo(),position = jugador.position(),colorMunicion=jugador.color(),sonidoEncendido = jugador.sonido(),caracteresParaEvento=jugador.caracteres(),jugador1=jugador)
		objetivo.iniciarMoviento()
		teletransportarse = true
		}
		else{
			teletransportacion.play()
			jugador.cambiarPosicion(objetivo.position())
			jugador.cambiarMunicion(jugador.municionPorDefecto())
			objetivo.quitar()
		}
	}
}