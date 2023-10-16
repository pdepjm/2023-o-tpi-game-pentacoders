import wollok.game.*

object jugador1 {

	var property position = game.center()
	var imagen = "abajo"
	var property municion = pelota
	var hp = 100
	var angulo = 0
	method image() = "pepita.png"

	method cambiarImagen(nuevaImagen) {
		imagen = nuevaImagen
	}

	method moverDerecha() {
		position = position.right(1)
		self.cambiarImagen("derecha")
	}

	method moverIzquierda() {
		position = position.left(1)
		self.cambiarImagen("izquierda")
	}

	method moverArriba() {
		position = position.up(1)
		self.cambiarImagen("arriba")
	}

	method moverAbajo() {
		position = position.down(1)
		self.cambiarImagen("abajo")
	}

	method rotarADerecha() { // si se toca la e
	angulo -= 45 
	if(angulo.equals(-45)){
			angulo=315
	}
	
	}

	method rotarAIzquierda() { // si se toca la q
	angulo += 45 
	if(angulo.equals(360)){
			angulo=0
	}
	
	}

	method disparar() {
		pelota.position(position)
		pelota.movete(angulo)
		game.addVisual(pelota)
		game.onTick(100, "movimiento", { pelota.movete(angulo)})
		
	}

}


//despues pasar a otro archivo wollok, genera una pelota(al ser un objeto) que se mueve en random(modificar para comportarlo como disparos)
object pelota {

	var property position = game.origin()

	method image() = "manolo.png"

	method movete(angulo) {
		if(angulo.equals(0)){
			position = position.right(1) 
		}
		if(angulo.equals(45)){
			position = position.up(1).right(1) 
		}
		if(angulo.equals(90)){
			position = position.up(1) 
		}
		if(angulo.equals(135)){
			position = position.up(1).right(-1) 
		}
		if(angulo.equals(180)){
			position = position.right(-1) 
		}
		if(angulo.equals(225)){
			position = position.up(-1).right(-1) 
		}		
		if(angulo.equals(270)){
			position = position.up(-1)
		}
		if(angulo.equals(315)){
			position = position.up(-1).right(1)
		}
	}

}