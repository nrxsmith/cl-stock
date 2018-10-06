# cl-stock
A command line stock quote retriever.

A few years ago when I was teaching myself Ruby, I was interested in seeing how much of my internet life I could engage in from the command line. I was also following the stock markets a little more closely then than I do now, so this was an effort to get something local I could run whenever instead fo clicking over to my browser.

It's essentially just a web scraper. It still worked when I last checked (10/6/2018), which honestly surprised me after all this time, but hooray.

It's easy to use if you want to try it out. Clone the repo, bundle install, and then edit the config/tickers.txt file to include the stock tickers you want to track (one ticker per line). To run, just enter `ruby bin/stock.rb'.
