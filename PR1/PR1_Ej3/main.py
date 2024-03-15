from Cocinero import Cocinero
from HamburguesaBuilder import HamburguesaBuilder
from HamburguesaNormalBuilder import HamburguesaNormalBuilder
from HamburguesaSinGlutenBuilder import HamburguesaSinGlutenBuilder
from HamburguesaVeganaBuilder import HamburguesaVeganaBuilder
from Hamburguesa import Hamburguesa


# Creamos la "receta" de las hamburguesas sin gluten y le decimos al cocinero que la cocine
sinGluten = HamburguesaSinGlutenBuilder()
cocinero = Cocinero(sinGluten)
cocinero.build_hamburguesa()
print("Hamburguesa sin gluten: ")
sinGluten.hamburguesa.__str__()

# Creamos la "receta" de las hamburguesas normales y que se cocinen
normal = HamburguesaNormalBuilder()
cocinero = Cocinero(normal)
cocinero.build_hamburguesa()
print("\nHamburguesa normal: ")
normal.hamburguesa.__str__()

# Creamos la "receta" de las hamburguesas veganas y que se cocinen
vegana = HamburguesaVeganaBuilder()
cocinero = Cocinero(vegana)
cocinero.build_hamburguesa()
print("\nHamburguesa vegana: ")
vegana.hamburguesa.__str__()

# En el cocinero/director, cuando se hace el build hamburguesa, este va haciendo de uno en uno
# cada método para construir las hamburguesas. La hamburguesa vegana no tiene método de construcción
# de queso de cabra, por lo que ponemos el if hassatr, el cual comprueba si el builder tiene
# ese método lo llama, si no, no lo hace.
# No sería mejor poner todos los métodos de creación dentro de los builder de cada hamburguesa
# en vez de en el cocinero? Entiendo que no puede ser así ya que si no se rompe la gracia del
# patrón (el cocinero es el que controla el proceso de creación), pero de otra forma hay que hacer
# comprobación de que estén los métodos o no (como el caso del queso de cabra)



