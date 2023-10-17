import wollok.game.*

// definicion clase pelota
class Pelota {

	var property position = game.origin()

	method image() = "pelota.png"

	method movete(angulo) {
		if (angulo.equals(0)) {
			position = position.right(1)
		} else if (angulo.equals(45)) {
			position = position.up(1).right(1)
		} else if (angulo.equals(90)) {
			position = position.up(1)
		} else if (angulo.equals(135)) {
			position = position.up(1).right(-1)
		} else if (angulo.equals(180)) {
			position = position.right(-1)
		} else if (angulo.equals(225)) {
			position = position.up(-1).right(-1)
		} else if (angulo.equals(270)) {
			position = position.up(-1)
		} else if (angulo.equals(315)) {
			position = position.up(-1).right(1)
		}
	}

}

