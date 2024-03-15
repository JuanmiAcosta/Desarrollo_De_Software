from ScrapeStrategy import ScrapeStrategy
from selenium import webdriver
from selenium.webdriver.common.by import By

class SeleniumStrategy(ScrapeStrategy):

    def __init__(self):
        self.class_boton = 'btn.secondary.accept-all'
        self.pathsABuscar = [('//*[@id="quote-summary"]/div[1]/table/tbody/tr[2]/td[2]', 'open_value'),
                             ('//*[@id="quote-summary"]/div[1]/table/tbody/tr[1]/td[2]', 'previous_close'),
                             ('//*[@id="quote-summary"]/div[1]/table/tbody/tr[7]/td[2]', 'volume'),
                             ('//*[@id="quote-summary"]/div[2]/table/tbody/tr[1]/td[2]', 'market_cap')]
        self.valores = {}

    def buscarYObtenerValores(self, driver, i):
        encontrado = driver.find_element(By.XPATH, self.pathsABuscar[i][0])
        self.valores[self.pathsABuscar[i][1]] = encontrado.text.strip()

    def scrape(self, url):
        
        option = webdriver.ChromeOptions()
        option.add_argument('headless')
        driver = webdriver.Chrome(options = option)

        driver.get(url)

        #Primera tarea aceptar las cookies del button con class -> btn secondary accept-all 
        #Realmente no hace falta pero es por probar un poco las funcionalidades de Selenium
        btn_cookies = driver.find_element(By.CLASS_NAME ,self.class_boton)
        btn_cookies.click()

        #Segunda tarea obtener los valores de la pagina

        for i in range(len(self.pathsABuscar)):
            self.buscarYObtenerValores(driver, i)

        driver.quit()

        return self.valores