import wollok.game.*

class direccion{
	
	method estaAlFinal(posicion) = (posicion.x() == 0 or posicion.x() == (game.width() - 1) or posicion.y() == 0 or posicion.y() == (game.height() - 1) )
	
	
	
		
}

object arriba inherits direccion{
	 method coordenada (posicion) = posicion.up(1)

}



object abajo inherits direccion{
	 method coordenada (posicion) = posicion.down(1)

}


object derecha inherits direccion{
	 method coordenada (posicion) = posicion.right(1)
	
}


object izquierda inherits direccion{
	 method coordenada (posicion) = posicion.left(1)

}



//_________________________________________________________________

object arribaDerecha inherits direccion{
	method coordenada (posicion) =  posicion.up(1).right(1)
	
}

object arribaIzquierda inherits direccion{
	
	method coordenada (posicion) = posicion.up(1).left(1)
	
}


object abajoIzquierda inherits direccion{
	
	method coordenada (posicion) = posicion.down(1).left(1)
	
}


object abajoDerecha inherits direccion{
	method coordenada (posicion) = posicion.down(1).right(1)
	
	
}
