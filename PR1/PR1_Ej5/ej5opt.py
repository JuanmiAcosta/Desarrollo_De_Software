import requests
import json
from time import sleep

#imports for BeautifulSoup
from bs4 import BeautifulSoup

#imports for Selenium
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By

class ScrapeStrategy():
    def scrape(self, url):
        pass


class BeautifulSoupStrategy(ScrapeStrategy):

    def scrape(self, url):

        response = requests.get(url)
        valores = {}

        if response.status_code == 200:

            soup = BeautifulSoup(response.content, 'html.parser')

            open_value_td = soup.find('td', {'data-test': 'OPEN-value'})
            
            if open_value_td:
                valores['open_value'] = open_value_td.text.strip() 
            else:
                return 'Open Value not found'
            
            previous_close_td = soup.find('td', {'data-test': 'PREV_CLOSE-value'})

            if previous_close_td:
                valores['previous_close'] = previous_close_td.text.strip()
            else:
                return 'Previous Close not found'
            
            volume_td = soup.find('td', {'data-test': 'TD_VOLUME-value'})

            if volume_td:
                valores['volume'] = volume_td.text.strip()
            else:
                return 'Volume not found'
            
            market_cap_td = soup.find('td', {'data-test': 'MARKET_CAP-value'})

            if market_cap_td:
                valores['market_cap'] = market_cap_td.text.strip()
            else:
                return 'Market Cap not found'
            
            return valores
            
        else:
            return f'Failed to retrieve the webpage, status code: {response.status_code}'



class SeleniumStrategy(ScrapeStrategy):
    def scrape(self, url):
        
        option = webdriver.ChromeOptions()
        driver = webdriver.Chrome(options = option)

        driver.get(url)
        #print(driver.page_source)

        valores = {}

        #Primera tarea aceptar las cookies del button con class -> btn secondary accept-all 
        #Realmente no hace falta pero es por probar un poco las funcionalidades de Selenium
        btn_cookies = driver.find_element(By.CLASS_NAME ,'btn.secondary.accept-all')
        btn_cookies.click()

        #Segunda tarea obtener los valores de la pagina

        open_value = driver.find_element(By.XPATH, '//*[@id="quote-summary"]/div[1]/table/tbody/tr[2]/td[2]')
        valores['open_value'] = open_value.text

        previous_close = driver.find_element(By.XPATH, '//*[@id="quote-summary"]/div[1]/table/tbody/tr[1]/td[2]')
        valores['previous_close'] = previous_close.text

        volume = driver.find_element(By.XPATH, '//*[@id="quote-summary"]/div[1]/table/tbody/tr[7]/td[2]')
        valores['volume'] = volume.text

        market_cap = driver.find_element(By.XPATH, '//*[@id="quote-summary"]/div[2]/table/tbody/tr[1]/td[2]')
        valores['market_cap'] = market_cap.text

        driver.quit()

        return valores



class Context:
    def __init__(self, strategy):
        self._strategy = strategy

    def set_strategy(self, strategy):
        self._strategy = strategy

    def scrape(self, url):
        return self._strategy.scrape(url)



url = 'https://finance.yahoo.com/quote/TSLA'
context = Context(BeautifulSoupStrategy())
valoresBeautifulSoup = context.scrape(url)

# Paso de Diccionario en Python (map) a JSON
valoresJSON_B = json.dumps(valoresBeautifulSoup)

print('Valores recogidos con BeautifulSoup:\t',valoresJSON_B)

context.set_strategy(SeleniumStrategy())
valoresSelenium = context.scrape(url)

# Paso de Diccionario en Python (map) a JSON
valoresJSON_S = json.dumps(valoresSelenium)

print('Valores recogidos con Selenium:\t', valoresJSON_S)

