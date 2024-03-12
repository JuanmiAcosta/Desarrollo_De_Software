import math

class SalpicaderoTarget():

    def __init__(self, velocidad_lineal, velocidad_angular, distancia, estado_motor):
        self.filtros = []
        self.radio_eje = 0.15
        self.estado_motor_actual = estado_motor
        self.velocidad_lineal = velocidad_lineal
        self.velocidad_angular = velocidad_angular
        self.distancia = distancia

    def ejecutar(self, revoluciones, estado_motor):
        self.estado_motor_actual = estado_motor
        self.velocidad_lineal = 2*math.pi*self.radio_eje*revoluciones*(60/1000)
        self.distancia += self.velocidad_lineal*tiempo

        if self.velocidad_lineal <= 0:
            self.setVelocidadLineal(0)

    def printEstadoMotor(self):
        print (f'Estado motor: {self.estado_motor_actual.name}')

    def printSalpicadero(self):
        print (f'Velocidad lineal: {self.velocidad_lineal}')
        print (f'Distancia: {self.distancia}')
        print (f'Velocidad angular: {self.velocidad_angular}')

    def setEstadoMotor(self, estado_motor):
        self.estado_motor_actual = estado_motor
    
    def setVelocidadLineal(self, velocidad_lineal):
        self.velocidad_lineal = velocidad_lineal

    def setVelocidadAngular(self, velocidad_angular):
        self.velocidad_angular = velocidad_angular

    def setDistancia(self, distancia):
        self.distancia += distancia

    def getEstadoMotor(self):
        return self.estado_motor_actual
    
    def getVelocidadLineal(self):
        return self.velocidad_lineal
    
    def getVelocidadAngular(self):
        return self.velocidad_angular
    
    def getDistancia(self):
        return self.distancia

    
  
