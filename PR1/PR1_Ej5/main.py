import json

from Context import Context

from BeautifulSoupStrategy import BeautifulSoupStrategy
from SeleniumStrategy import SeleniumStrategy

def main():

    url = 'https://finance.yahoo.com/quote/TSLA'
    context = Context(BeautifulSoupStrategy())
    valoresBeautifulSoup = context.scrape(url)

    # Paso de Diccionario en Python (map) a JSON
    valoresJSON_B = json.dumps(valoresBeautifulSoup)

    print('Valores recogidos con BeautifulSoup:\t',valoresJSON_B)

    #Pasamos a generar un archivo JSON con los valores recogidos
    #Como son los mismos datos lo hacemos con los recogidos con BeautifulSoup mismo

    with open('valores.json', 'w') as file:
        json.dump(valoresBeautifulSoup, file, indent=4)

    print('Archivo JSON generado con los valores recogidos')

    context.set_strategy(SeleniumStrategy())
    valoresSelenium = context.scrape(url)

    # Paso de Diccionario en Python (map) a JSON
    valoresJSON_S = json.dumps(valoresSelenium)

    print('Valores recogidos con Selenium:\t', valoresJSON_S)


if __name__ == "__main__":
    main()


