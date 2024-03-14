from Cocinero import Cocinero
from HamburguesaNormalBuilder import HamburguesaNormalBuilder

# =================================================== #

# Debes definir las clases HamburguesaNormalBuilder y HamburguesaSinGlutenBuilder

# Instanciamos un builder para HamburguesaNormalBuilder
builder = HamburguesaNormalBuilder()
# Cocinamos la hamburguesa normal
cocinero = Cocinero(builder)
ingredientes_hamburguesa = cocinero.construirHamburguesaNormal()

cocinero.quitarQueso()
cocinero.quitarSalsa()
cocinero.quitarHuevo()
cocinero.quitarTomate()
cocinero.quitarLechuga()
cocinero.quitarBacon()
cocinero.quitarCebolla()

print(ingredientes_hamburguesa)