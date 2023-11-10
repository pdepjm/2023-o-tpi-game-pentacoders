# PentaWarriors

## Equipo de desarrollo

- Bergera Vila, German Martín
- Borquez Belli, Pablo Joaquín
- Lazarte, Carlos Nahuel
- Riolffi, Ignacio Joaquín
- Tiscornia, Matías José

## Capturas
### Modo Iniciar
![captura](/capturas/MenuIniciar.png) 
![captura](/capturas/Iniciar1.png) 
![captura](/capturas/Iniciar2.png) 
![captura](/capturas/Iniciar3.gif) 
![captura](/capturas/Iniciar4.png) 

### Modo Entrenar 
![captura](/capturas/MenuEntrenar.png) 
![captura](/capturas/Entrenar1.png) 
![captura](/capturas/Entrenar2.gif) 
![captura](/capturas/Entrenar3.gif) 

## Reglas de Juego / Instrucciones
### Jugadores
#### Jugador 1
![jugador1](/assets/Jugador1_derecha.png) 
#### Jugador 2
![jugador2](/assets/Jugador2_derecha.png)  
#### Enemigo
![enemigo](/assets/enemigoAmarillo.png) ![enemigo](/assets/enemigoBlanco.png) ![enemigo](/assets/enemigoCeleste.png) ![enemigo](/assets/enemigoVerde.png) ![enemigo](/assets/enemigoVioleta.png)  

### Controles
- Jugador 1
  - Mover derecha: D
  - Mover izquierda: A
  - Mover arriba: W
  - Mover abajo: S
  - Rotar en sentido horario: E
  - Rotar en sentido antihorario: Q
  - Disparar: SPACE
  
- Jugador 2 
  - Mover derecha: RIGHT
  - Mover izquierda: LEFT
  - Mover arriba: UP
  - Mover abajo: DOWN
  - Rotar en sentido horario: O
  - Rotar en sentido antihorario: I
  - Disparar: P
### Introducción
PentaWarriors es un juego combate en el espacio, dinámico y con elementos aleatorios como cometas, powerUps y un enemigo que cambia de color, se burla de los jugadores, se mueve y dispara solo. 

### Modos de juego
#### Entrenamiento
Este modo está pensado para practicar los movimientos y probar los powerUps. Tiene un enemigo que se puede matar, la forma de quitarle vida es chocando con él (estando en la misma posición) o disparándole. Cuando muere se puede seguir jugando, pudiendo así probar los diferentes powerUps. No hay cometas en este modo. 
#### Iniciar (2 jugadores)
Este modo es de dos jugadores, el objetivo es vencer al otro jugador. Hay un enemigo en común que se puede matar. La forma de quitarle vida es chocando con él (estando en la misma posición). Hay cometas que aparecen aleatoriamente, de diferentes colores y con un patrón de movimiento aleatorio entre los definidos. Estos cometas además si colisionan con los jugadores le quitan vida. Cada 25 segundos se invierten las posiciones de los jugadores, es decir, un jugador pasa a ser el otro pero conserva sus propiedades (munición y vida) y se mantienen los controles. Los powerUps aparecen de forma aleatoria.
#### Controles
Para cambiar el modo usar UP o DOWN. Para ingresar al modo elegido pulsar ENTER. Con BACKSPACE se puede regresar al menú dentro de cualquier modo.

### PowerUps
![vida](/assets/vida.png) Vida: hace que el jugador recupere 250 de vida

![portal](/assets/portal.png) Teletransportación: cambia la munición por un aim ![aim](/assets/aimVerde.png) . Para activar la teletransportación se debe volver a disparar cuando el aim llegue a la posición deseda. Es de un solo uso, luego de usarlo el jugador regresa a la munición por defecto. El aim solo puede ser activado dentro del tablero de juego, si llega al final y no fue activado, el jugador regresa a la munición por defecto.

![sierra](/assets/sierra.png) Munición sierra: mejora la munición ![sierra](/assets/sierraAmarillo.png) . Esta munición resta 60 de vida al oponente.

![bomba](/assets/bomba.png)  Bomba: cambia la munición por una bomba ![bomba](/assets/bombaMunicionVerde.png). Para activarla, se debe volver a disparar cuando la bomba llegue a la posición deseda. La explosión dispara pelotas en todas las direcciones. Es de un solo uso, luego de usarla el jugador regresa a la munición por defecto. La bomba solo puede ser activada dentro del tablero de juego, si llega al final y no fue activada, el jugador regresa a la munición por defecto.

### Cometas
![vida](/assets/cometaAmarillo.png) 
![vida](/assets/cometaCeleste.png) 
![vida](/assets/cometaVerde.png) 
![vida](/assets/cometaVioleta.png) 


## Otros

- UTN.FRBA k2004/2104
- Versión de wollok: 3.0.0
- Una vez terminado, no tenemos problemas en que el repositorio sea público
