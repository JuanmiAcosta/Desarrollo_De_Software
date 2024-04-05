from abc import ABC, abstractmethod

class ScrapeStrategy(ABC):

    @abstractmethod
    def scrape(self, url):
        pass