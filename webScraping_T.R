#scraping& search pattern. æ„¿∫√• P88
url="https://www.similarweb.com/top-websites/category/computer-and-electronics/programming"
webp= readLines(url, encoding="UTF-8")
head(webp)

mypattern= "href.*net\\b"
(web_myp <- grep(mypattern, webp))

webp[web_myp]

# many webpage
