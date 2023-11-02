import jugadores.*
import direcciones.*

class Angulo {
	var direcciones = [arriba,arribaDerecha,derecha,abajoDerecha,abajo,abajoIzquierda,izquierda,arribaIzquierda]
	var contador = 0
}

object horario inherits Angulo {

	method anguloCorroborado(jugador, posicionLista) {
		contador = posicionLista + 1
		if (contador==8) contador=0
		return direcciones.get(contador)
		}
	method actualizarContador(posicionLista){
		return contador
	}

}

object antihorario inherits Angulo{
	method anguloCorroborado(jugador , posicionLista) {
		contador = posicionLista-1
		if (contador==-1) contador=7
		
		return direcciones.get(contador)
	} 
	method actualizarContador(posicionLista){
		return contador
	}
}