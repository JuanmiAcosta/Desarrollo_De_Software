from Cocinero import Cocinero
from HamburguesaBuilder import HamburguesaBuilder
from HamburguesaNormalBuilder import HamburguesaNormalBuilder
from HamburguesaSinGlutenBuilder import HamburguesaSinGlutenBuilder
from HamburguesaVeganaBuilder import HamburguesaVeganaBuilder
from Hamburguesa import Hamburguesa
from DisplayPedidos import DisplayPedidos

# Creamos la pantalla, la cual notifica de los pedidos listos
pantalla = DisplayPedidos()


# Creamos la "receta" de las hamburguesas sin gluten y le decimos al cocinero que la cocine
sinGluten = HamburguesaSinGlutenBuilder()
cocinero = Cocinero(sinGluten)
cocinero.attach(pantalla) # Añadimos el observador!!
cocinero.build_hamburguesa()
# print("Hamburguesa sin gluten: ")
# sinGluten.hamburguesa.__str__()
cocinero.notify()

# Creamos la "receta" de las hamburguesas normales y que se cocinen
normal = HamburguesaNormalBuilder()
cocinero.cambiaReceta(normal)
cocinero.build_hamburguesa()
# print("\nHamburguesa normal: ")
# normal.hamburguesa.__str__()

# Creamos la "receta" de las hamburguesas veganas y que se cocinen
vegana = HamburguesaVeganaBuilder()
cocinero.cambiaReceta(vegana)
cocinero.build_hamburguesa()
# print("\nHamburguesa vegana: ")
# vegana.hamburguesa.__str__()
cocinero.notify()




