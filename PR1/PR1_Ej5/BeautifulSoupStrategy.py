from ScrapeStrategy import ScrapeStrategy
from bs4 import BeautifulSoup
import requests

class BeautifulSoupStrategy(ScrapeStrategy):

    def __init__(self):
        self.html = 'td'
        self.tag = 'data-test'
        self.valoresABuscar = [('OPEN-value', 'open_value'), ('PREV_CLOSE-value','previous_close'), ('TD_VOLUME-value','volume'), ('MARKET_CAP-value','market_cap')]
        self.valores = {}


    def buscarYObtenerValores(self, soup, i):
        encontrado = soup.find(self.html, {self.tag: self.valoresABuscar[i][0]})
            
        if encontrado:
            self.valores[self.valoresABuscar[i][1]] = encontrado.text.strip() 
        else:
            return f'{self.valoresABuscar[i][1]} not found'
        
        
    def scrape(self, url):

        response = requests.get(url)

        if response.status_code == 200:

            soup = BeautifulSoup(response.content, 'html.parser')

            for i in range(len(self.valoresABuscar)):
                self.buscarYObtenerValores(soup, i)

            return self.valores
            
        else:

            return f'Failed to retrieve the webpage, status code: {response.status_code}'