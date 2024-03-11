from GestorFiltros import GestorFiltros
from Cliente import Cliente
from SalpicaderoTarget import SalpicaderoTarget
from CalcularVelocidad import CalcularVelocidad
from RepercutirRozamiento import RepercutirRozamiento
def main():
    #Creamos el objetivo, un gestor de filtros y filtros
    target = SalpicaderoTarget()
    gestorFiltros = GestorFiltros(target)
    filtroVelocidad = CalcularVelocidad()
    rozamiento = RepercutirRozamiento()

    #Añadimos al gestor de filtros, los filtros creados
    gestorFiltros.addFiltro(filtroVelocidad)
    gestorFiltros.addFiltro(rozamiento)

    #Creamos el cliente
    cliente = Cliente(gestorFiltros)

    #El cliente hace una petición de filtros(los ejecuta)
    cliente.ejecutarFiltros()

    if __name__ == "__main__":
        main()
