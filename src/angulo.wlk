import jugadores.*

class Angulo {
	
	method anguloCorroborado(anguloBase){
		
		if (anguloBase.equals(-45)) 
			return 315
		else if (anguloBase.equals(360)) 
			return 0
		else
			return anguloBase
			
		
		
	}
	
}


object derecha {
	
	
	
	
	method anguloCorroborado(jugador, anguloBase){
		
		var angulo = anguloBase - 45
		
		if (angulo.equals(-45))
			return 315
		else
			return angulo
		
	}
	
	
	
	
}


object izquierda {
	
	
	
	method anguloCorroborado(jugador,anguloBase){
		
	
		var angulo = anguloBase + 45
		
		if (angulo.equals(360))
			return 0
		else
			return angulo
		
	}
	
	
}

//HACER 2 WKO, 1 POR DER Y OTRO POR IZQ
