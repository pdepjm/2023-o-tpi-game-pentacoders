import wollok.game.*

class Direccion {

	//method estaAlFinal(posicion) = (posicion.y() == (game.height() - 1)) or (posicion.y() == 0) or (posicion.x() == (game.width() - 1)) or (posicion.x() == 0)
	// tuvimos que comentar esto, ya que cuando x=0 o y=0 o llegaba a loslimites se dejaba de mover la nave
	// volvimos a como teniamos antes 
}

object arriba inherits Direccion {

	method coordenada(posicion) = posicion.up(1)

	method estaAlFinal(posicion) = posicion.y() == (game.height() - 1)

}

object abajo inherits Direccion {

	method coordenada(posicion) = posicion.down(1)

	method estaAlFinal(posicion) = posicion.y() == 0

}

object derecha inherits Direccion {

	method coordenada(posicion) = posicion.right(1)

	method estaAlFinal(posicion) = posicion.x() == (game.width() - 1)

}

object izquierda inherits Direccion {

	method coordenada(posicion) = posicion.left(1)

	method estaAlFinal(posicion) = posicion.x() == 0

}

//_________________________________________________________________
object arribaDerecha inherits Direccion {

	method coordenada(posicion) = posicion.up(1).right(1)

}

object arribaIzquierda inherits Direccion {

	method coordenada(posicion) = posicion.up(1).left(1)

}

object abajoIzquierda inherits Direccion {

	method coordenada(posicion) = posicion.down(1).left(1)

}

object abajoDerecha inherits Direccion {

	method coordenada(posicion) = posicion.down(1).right(1)

}

