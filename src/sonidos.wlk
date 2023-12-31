import wollok.game.*

object disparoSonido {
	method play (){
		game.sound("sonidoDisparo.mp3").play()
	}
}
object lanzamiento {
	method play (){
		const sonido = game.sound("launchSound.mp3")
		//sonido.volume(0.9)
		sonido.play()
	}
}
object explosion {
	
	method play (){
		const sonido = game.sound("explosion.mp3")
		sonido.volume(0.8)
		sonido.play()
	}
}

object teletransportacion {
	
	method play (){
		game.sound("teletransportacion.mp3").play()
	}
}

object powerUp {
	
	method play (){
		const sonido = game.sound("powerUp.mp3")
		sonido.volume(0.6)
		sonido.play()
	}
}
object sierra {
	
	method play (){
		const sonido = game.sound("sierra.mp3")
		sonido.volume(0.5)
		sonido.play()
	}
}
object sonidoMenu {
	
	method play (){
		game.sound("sonidoMenu.mp3").play()
	}
}

object musicaMenu{
var musica = game.sound("musicaMenu.mp3")
	method play (){
		musica = game.sound("musicaMenu.mp3")
		musica.shouldLoop(true)
		musica.volume(0.5)
		musica.play()
	}
	
	method stop(){
		musica.stop()
	}
}
object musicaFondo{
var musica = game.sound("musicaFondo.mp3")
	method play (){
		musica = game.sound("musicaFondo.mp3")
		musica.shouldLoop(true)
		musica.volume(0.5)
		musica.play()
	}
	method stop(){
		musica.stop()
	}
}

