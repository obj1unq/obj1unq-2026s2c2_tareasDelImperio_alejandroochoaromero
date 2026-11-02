# El Tahuantinsuyo – Gestión del Imperio

El Imperio Inca se sostenía gracias a una compleja red de organización social y comunitaria. La unidad básica de la sociedad era el Ayllu (comunidad de familias). Dentro de este sistema, cada miembro cumplía roles específicos y realizaba tareas obligatorias para el bienestar del imperio.

Este es un sistema que busca calcular cómo las tareas comunitarias aportan recursos a los depósitos centrales (_colcas_) e impactan en la energía de los habitantes del Tahuantinsuyo.

## 1. Tareas

Cada tarea produce una cierta cantidad de recursos dependiendo del tiempo (medido en horas) que se le destine. En esta cultura se contemplan varios tipos de tareas descriptas mas abajo. Independientemente de cuál sea la tarea, el cálculo para saber cuántos recursos produce una tarea siempre depende del tiempo dedicado y del nivel de esfuerzo de la persona, siguiendo la fórmula: 

> recursos-producidos = 50 * (tiempo - desgaste) * esfuerzo

El tiempo es un dato que se conoce al momento de consultar cuántos recursos se producen, mientras que el desgaste y el esfuerzo dependerán del caso según se detalla:

* Siembra: Esta tarea puede realizarse en el valle o en las montañas (en cuyo caso se necesitan terrazas de cultivo). El desgaste producido por la siembra depende del tiempo de trabajo: el desgaste es 1 si la jornada es normal y se le suma 1 por cada hora extra. Por otro lado, la siembra conlleva un esfuerzo que depende del cultivo, entonces es configurable en cada caso. 
   * La *siembra en el valle* tiene jornadas que no deberían superar las 8 horas, pero de depende de la estación del año: si es época de lluvias (de diciembre a junio) no puede realizarse y por lo tanto los recusos producidos equivalen a 0. 
   * La *siembra en terrazas* tiene jornadas de trabajo de hasta 6 horas (porque las personas están mas expuestas al viento y al sol). es una tarea que requiere conocer el recorrido del sol y siempre produce el triple de recursos debido al uso eficiente del agua, es decir que: recursos-producidos = 3 * 50 * (tiempo - desgaste) * esfuerzo

* Mensaje: Los mensajes se llevan a pie por los caminos del imperio, codificados mediante el Quipu. El esfuerzo es siempre 1.4 mientras el desgaste se calcula como: tiempo / 4.

* Mensaje imperial: Es un tipo especial de mensaje que lleva mensajes urgentes con las siguientes diferencias. El esfuerzo es siempre 1.8 y el desgaste es de 2 horas menos de lo que se desgasta con un mensaje normal, pero el valor 1 es el mínimo posible.

### Ejemplos

* Suponer la actividad siembra de papa como una tarea de siembra en el valle. El esfuerzo de cultivar papa es 1.2. Suponiendo que estamos en época seca, y al practicarse por 4 horas producirá: 50 * (4 - 1) * 1.2 = 180. Al practicarse por 10 horas producirá: 50 * (10 - (1+2)) * 1.2 = 420

* Suponer la actividad siembra de maiz en terraza. El esfuerzo de cultivar maiz es 1.5. Al practicarse por 5 horas producirá: 3 * 50 * (5 - 1) * 1.5 = 900. Al practicarse por 7 horas producirá: 3 * 50 * (7 - (1+1)) * 1.5 = 1125

* Ruta Tambo Central es una tarea de mensaje. Al practicarse por 4 horas producirá: 50 * (4 - (4 / 4)) * 1.4 = 210. Al practicarse por 10 horas producirá: 50 * (10 - (10 / 4)) * 1.4 = 525

* Camino del Sapa Inca es una mensaje imperial. Al practicarse por 4 horas producirá: 50 * (4 - 1) * 1.8 = 270 (Nota: (4/4) - 2 = -1, se toma el máximo con 1). Al practicarse por 10 horas producirá: 50 * (10 - 1) * 1.8 = 810



## 2. Habitantes

Los habitantes cumplen distintas tareas, y el tiempo que dedican a cada una depende de su rol o categoría social. Además, existen reglas para que un habitante pueda realizar una tarea, y no siempre es posible.

Cuando realizan una tarea, pierden energía dependiendo de los recursos producidos durante ese tiempo y del índice de resistencia, que es un modelo del organismo del habitante dependiente de su categoría social.  Solo realizan la tarea si su energía actual es suficiente para la tarea, es decir que supera a la energía que se perdería para realizarla.  De manera general, la energía que pierde un habitante al hacer una tarea se estima con la siguiente fórmula:

> energia-perdida = recursos-producidos / indice-resistencia

Mientras que recursos-producidos se resolvió en el punto anterior, el índice se detalla para cada tipo de habitante:

* Persona campesina: El índice de resistencia de estas personas es 10. El tiempo que ejercitan una tarea se establece para cada una individualmente.
* Persona de Elite: Son habitantes desplazados para tareas estratégicas (las que producen muchos recursos) con índice de resistencia 12. Además tienen una variación en su fórmula para calcular la energía perdida, porque siempre pierden 5 puntos menos de energía que el resto de los habitantes al realizar una tarea. El tiempo que le dedican a cada tarea es de 10 horas, y tienen una condición adicional para realizar la tarea: solo la pueden realizar si los recursos que esta produciría superan 500. 


### Requerimientos:
* Saber cuánta energía perdería un habitante al realizar una tarea.
* Que un habitante aplique una tarea consumiendo parte de su energía actual.


### Casos de prueba

* Cusi es un campesino de energía 100 y dedica 4 horas por tarea. Al realizar las siguientes tareas del punto anterior, su energía final será:
   * Siembra de Papa: 100 - (180 / 10) = 82
   * Ruta Tambo Central: 100 - (210 / 10) = 79
 
*  Si le cambiamos la energía a Cusi para que sea 15, no podría practicar ninguna de esas tareas (por ejemplo, Siembra de Papa) y su energía se mantendría en 15.

* Túpac es un habitante de elite de energía 200. Al practicar las tareas del punto anterior (trabajando 10 horas), su energía final será: 
   * Siembra de maiz en terrazas: 200 - ((1125 / 12) - 5) = 111,25
   * Camino del Sapa Inca: 200 - ((810 / 12) - 5) = 137,5

## Ayllus (Comunidades)

Un Ayllu está compuesto por varias Colcas (zonas)), y de estas colcas se conocen las tareas que están habilitadas para realizarse en cada una. 

### Requerimientos:

Se pide resolver lo siguiente:

* Conocer la mejor Colca de un Ayllu para un habitante: Es la Colca que más recursos le haría producir a ese habitante si este practicara todas las tareas asignadas a esa Colca una vez.
* Conocer las Colcas suaves de un Ayllu para un habitante: Es el conjunto de Colcas que tienen al menos una tarea que le hace producir menos de 200 recursos al habitante.
* Conocer las tareas más exigentes del Ayllu para un habitante: Es el conjunto formado por la tarea más exigente de cada Colca para ese habitante. La tarea más exigente es la que más recursos le hace producir al habitante.

### Casos de prueba

El Ayllu Real tiene dos Colcas: la Colca Agrícola (donde se realiza Siembra de Papa y Construcción de Andenes en el Valle Sagrado) y la Colca central (por donde pasan todos los mensajes).

* La mejor Colca del Ayllu Real para Túpac es la Agrícola, ya que le hace producir 2000 recursos en total (con 10 horas de trabajo), mientras que la Monumental le hace producir 1380.
* La mejor Colca del Ayllu Real para Cusi es la Agrícola, ya que le hace producir 855 recursos en total (con 4 horas de trabajo), mientras que la Monumental le hace producir 480.
* Para Túpac no hay Colcas suaves en el Ayllu Real.
* Para Cusi, el conjunto de Colcas suaves incluye únicamente a la Colca Agrícola, ya que allí puede realizar Siemba de Papa produciendo solo 180 recursos.
* Para Túpac, las tareas más exigentes del Ayllu Real son Construcción de Andenes en el Valle Sagrado y Construcción del Templo del Sol.
* Para Cusi, las tareas más exigentes del Ayllu Real son Construcción de Andenes en el Valle Sagrado y Construcción del Templo del Sol.

