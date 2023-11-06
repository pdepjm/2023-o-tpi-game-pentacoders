import wollok.game.*



object arriba {

	method coordenada(posicion) = posicion.up(1)

	method estaAlFinal(posicion) = posicion.y() == (game.height() - 1)

}

object abajo {

	method coordenada(posicion) = posicion.down(1)

	method estaAlFinal(posicion) = posicion.y() == 0

}

object derecha {

	method coordenada(posicion) = posicion.right(1)

	method estaAlFinal(posicion) = posicion.x() == (game.width() - 1)

}

object izquierda {

	method coordenada(posicion) = posicion.left(1)

	method estaAlFinal(posicion) = posicion.x() == 0

}

//_________________________________________________________________
object arribaDerecha {

	method coordenada(posicion) = posicion.up(1).right(1)

	method estaAlFinal(posicion) = (posicion.x() == (game.width() - 1) ) and ( posicion.y() == (game.height() - 1) )

}

object arribaIzquierda {

	method coordenada(posicion) = posicion.up(1).left(1) 

	method estaAlFinal(posicion) = (posicion.x() == (game.width() - 1) ) and ( posicion.x() == 0 )
}

object abajoIzquierda {

	method coordenada(posicion) = posicion.down(1).left(1) 
	
	method estaAlFinal(posicion) =  posicion.y() == 0 and posicion.y() == 0

}

object abajoDerecha {

	method coordenada(posicion) = posicion.down(1).right(1)
	
	method estaAlFinal(posicion) =  posicion.y() == 0 and ( posicion.y() == (game.height() - 1) )
}	

