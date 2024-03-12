from GestorFiltros import GestorFiltros
from Cliente import Cliente
from SalpicaderoTarget import SalpicaderoTarget
from CalcularVelocidad import CalcularVelocidad
from RepercutirRozamiento import RepercutirRozamiento
from EstadoMotor import EstadoMotor
from CadenaFiltros import CadenaFiltros

import time

import tkinter as tk

import threading

def main():
    def set_acelerando():
        estado.set("ACELERANDO")
        target.setEstadoMotor(EstadoMotor.ACELERANDO)

    def set_encender():
        estado.set("ENCENDIDO")
        target.setEstadoMotor(EstadoMotor.ENCENDIDO)

    def set_frenar():
        estado.set("FRENANDO")
        target.setEstadoMotor(EstadoMotor.FRENANDO)

    def calculoValores():
        while True:
            # El cliente hace una petición de filtros(los ejecuta)
            revoluciones = cliente.ejecutarFiltros()
            target.setVelocidadAngular(revoluciones)

            target.printSalpicadero()
            target.printEstadoMotor()

            tiempo_actual = time.time_ns()*(10**-9)
            tiempo_transcurrido = tiempo_actual - tiempo_inicial

            distancia_actual = target.getVelocidadLineal() * (tiempo_transcurrido / HORA_SEG)
            target.setDistancia(distancia_actual)

            #limpiar terminal
            print("\033c", end="")

            time.sleep(1)


    HORA_SEG = 3600
    tiempo_inicial = time.time_ns()*(10**-9)

    #Creamos el objetivo, un gestor de filtros y filtros
    estado = EstadoMotor.APAGADO
    vel_lin = 0
    dist_lin = 0
    vel_ang = 0

    target = SalpicaderoTarget(vel_lin,vel_ang,dist_lin,estado)
    gestorFiltros = GestorFiltros(target)
    filtroVelocidad = CalcularVelocidad()
    rozamiento = RepercutirRozamiento()

    cadenaFiltro = CadenaFiltros()
    #Añadimos al gestor de filtros, los filtros creados
    cadenaFiltro.addFiltro(filtroVelocidad)
    cadenaFiltro.addFiltro(rozamiento)

    gestorFiltros.addCadenaFiltro(cadenaFiltro)

    #Creamos el cliente
    cliente = Cliente(gestorFiltros)

    #Creamos el hilo de la pedalera
    calculo_thread = threading.Thread(target=calculoValores)
    calculo_thread.start()

    ## TKINTER GUI -------------------------------------

    buttonWindow = tk.Tk()
    buttonWindow.title("Pedalera")

    estado = tk.StringVar()
    estado.set("APAGADO")
    label = tk.Label(buttonWindow, textvariable=estado)
    label.pack()  # Place the label at the top of the window

    buttonSet = tk.Button(buttonWindow, text="ACELERANDO", command=set_acelerando)
    buttonSet.pack(side=tk.LEFT)
    buttonSet = tk.Button(buttonWindow, text="ENCENDER", command=set_encender)
    buttonSet.pack(side=tk.LEFT)
    buttonSet = tk.Button(buttonWindow, text="FRENAR", command=set_frenar)
    buttonSet.pack(side=tk.LEFT)

    buttonWindow.mainloop()
    
    ## TKINTER GUI -------------------------------------

    


if __name__ == "__main__":
    main()
