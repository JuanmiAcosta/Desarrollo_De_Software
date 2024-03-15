from GestorFiltros import GestorFiltros
from Cliente import Cliente
from SalpicaderoTarget import SalpicaderoTarget
from CalcularVelocidad import CalcularVelocidad
from RepercutirRozamiento import RepercutirRozamiento
from EstadoMotor import EstadoMotor
from CadenaFiltros import CadenaFiltros

import time

import tkinter as tk
from ttkbootstrap import Style

import threading

import math

def main():

    #Creamos las variables del salpicadero para pasarselas al constructor
    estado = EstadoMotor.APAGADO
    vel_lin = 0.0
    dist_lin = 0.0
    vel_ang = 0.0

    def set_acelerando():
        actual = label.cget("text")
        if actual == "ENCENDIDO" or actual == "FRENANDO":
            buttonAcelerar.config(text='SOLTAR ACELERADOR')
            estado.set("ACELERANDO")
            target.setEstadoMotor(EstadoMotor.ACELERANDO)
        elif actual == "ACELERANDO":
            buttonAcelerar.config(text='ACELERAR')
            estado.set("FRENANDO")
            target.setEstadoMotor(EstadoMotor.FRENANDO)

    def set_encender():
        actual = label.cget("text")
        if actual == "APAGADO":
            buttonEncender.config(text='APAGAR')
            estado.set("ENCENDIDO")
            target.setEstadoMotor(EstadoMotor.ENCENDIDO)
        else:
            buttonEncender.config(text='ENCENDER')
            estado.set("APAGADO")
            target.setEstadoMotor(EstadoMotor.APAGADO)

    def set_frenar():
        actual = label.cget("text")

        if actual == "ACELERANDO":
            estado.set("FRENANDO")
            target.setEstadoMotor(EstadoMotor.FRENANDO)

    def calculoValores():

        salpicaderoWindow = tk.Toplevel()
        salpicaderoWindow.title("Salpicadero")
        salpicaderoWindow.geometry('300x300')

        velocimetro = tk.StringVar()
        cuenta_km = tk.StringVar()
        cuenta_revoluciones = tk.StringVar()

        velocimetro.set(f'{target.getVelocidadLineal()} Km/h')
        cuenta_km.set(f'{target.getDistancia()} Km recorridos')
        cuenta_revoluciones.set(f'{math.floor(target.getVelocidadAngular())} rpm')

        # Configuramos la columna y el ancho de la columna
        salpicaderoWindow.grid_columnconfigure(0, weight=1)

        labelVelocimetro = tk.Label(salpicaderoWindow, textvariable=velocimetro, font=("Arial", 12))
        labelVelocimetro.grid(row=0, column=0, pady=10)

        labelCuentaKm = tk.Label(salpicaderoWindow, textvariable=cuenta_km, font=("Arial", 12))
        labelCuentaKm.grid(row=1, column=0, pady=5)

        labelCuentaRevoluciones = tk.Label(salpicaderoWindow, textvariable=cuenta_revoluciones, font=("Arial", 12))
        labelCuentaRevoluciones.grid(row=2, column=0, pady=5)

        # Centramos la ventana en la pantalla
        salpicaderoWindow.update_idletasks()
        width = salpicaderoWindow.winfo_width()
        height = salpicaderoWindow.winfo_height()
        x = (salpicaderoWindow.winfo_screenwidth() // 2) - (width // 2)
        y = (salpicaderoWindow.winfo_screenheight() // 2) - (height // 2)
        salpicaderoWindow.geometry('{}x{}+{}+{}'.format(width, height, x-500, y))

        while True:
            # limpiar terminal
            print("\033c")

            # El cliente hace una petición de filtros(los ejecuta)
            revoluciones = cliente.ejecutarFiltros()
            target.setVelocidadAngular(revoluciones)

            target.printSalpicadero()
            target.printEstadoMotor()

            tiempo_actual = time.time_ns() * (10 ** -9)
            tiempo_transcurrido = tiempo_actual - tiempo_inicial

            distancia_actual = target.getVelocidadLineal() * (tiempo_transcurrido / HORA_SEG)
            target.setDistancia(distancia_actual)

            try:
                # ACTUALIZAR VALORES GUI ------------------------------
                velocimetro.set(f'{round(target.getVelocidadLineal(),2)} Km/h')
                cuenta_km.set(f'{round(target.getDistancia(),3)} Km recorridos')
                cuenta_revoluciones.set(f'{math.floor(target.getVelocidadAngular())} rpm')
                #------------------------------------------------------
            except:
                pass

            time.sleep(1)


    HORA_SEG = 3600
    tiempo_inicial = time.time_ns() * (10 ** -9)

    #Creamos el objetivo(salpicadero)
    target = SalpicaderoTarget(vel_lin, vel_ang, dist_lin, estado)

    # Creamos gestor de filtros, cadena de filtros yfiltros
    gestorFiltros = GestorFiltros(target)
    filtroVelocidad = CalcularVelocidad()
    rozamiento = RepercutirRozamiento()

    cadenaFiltro = CadenaFiltros()
    # Añadimos al gestor de filtros, los filtros creados
    cadenaFiltro.addFiltro(filtroVelocidad)
    cadenaFiltro.addFiltro(rozamiento)

    gestorFiltros.addCadenaFiltro(cadenaFiltro)

    # Creamos el cliente
    cliente = Cliente(gestorFiltros)

    #PEDALERA WINDOW -------------------------------------------------------------------------
    buttonWindow = tk.Tk()
    buttonWindow.title("Pedalera")

    # Centramos la ventana en la pantalla
    buttonWindow.update_idletasks()
    width = 550
    height = 100
    x = (buttonWindow.winfo_screenwidth() // 2) - (width // 2)
    y = (buttonWindow.winfo_screenheight() // 2) - (height // 2)
    buttonWindow.geometry('{}x{}+{}+{}'.format(width, height, x + 200 , y))

    # Utiliza ttkbootstrap para cambiar el tema a oscuro
    Style(theme='darkly')  # Cambia el tema a 'darkly' (modo oscuro)

    estado = tk.StringVar()
    estado.set("APAGADO")
    label = tk.Label(buttonWindow, textvariable=estado, font=("Arial", 14, "bold"))
    label.grid(row=0, column=0, columnspan=3, pady=10)  # Se sitúa en la primera fila, que ocupa todas las columnas

    buttonAcelerar = tk.Button(buttonWindow, text="ACELERAR", command=set_acelerando, font=("Arial", 12), width=25)
    buttonAcelerar.grid(row=1, column=0, padx=10, pady=5)  # Se sitúa en la segunda fila, primera columna

    buttonEncender = tk.Button(buttonWindow, text="ENCENDER", command=set_encender, font=("Arial", 12), width=10)
    buttonEncender.grid(row=1, column=1, padx=10, pady=5)  # Se sitúa en la segunda fila, segunda columna

    buttonFrenar = tk.Button(buttonWindow, text="FRENAR", command=set_frenar, font=("Arial", 12), width=10)
    buttonFrenar.grid(row=1, column=2, padx=10, pady=5)  # Se sitúa en la segunda fila, tercera columna

    #SALPICADERO WINDOW -----------------------------------------------------------------------
    # Creamos el hilo de los vvalores y salpicadero
    calculo_thread = threading.Thread(target=calculoValores)
    calculo_thread.start()


    buttonWindow.mainloop()


if __name__ == "__main__":
    main()