def stock_picker(prices)
  #Purpose:
  ##Simply to find the buying and selling dates that would have earned the highest return :)

  #Algorithm:
  ##1. place pos on first index
  ##2. subtract element in pos+1 index from the element in pos
  ##3. set that element as the high, set buy as pos and sell as pos+1
  ##4. get next element and subtract from element in pos
  ##5. check if value > high if so set value as high,buy as pos,sell as element's index
  ##6. repeat 4. and 5. until end of array
  ##7. increment pos and repeat 4.,5.,6.
  ##8. do 7. until pos is second last index then eval elements in second last index and last index
  ### do 5. the value inside high should be the highest profit

  #Problems:
  ##1. highly inefficient
  ##2. Algorithm poorly written ;) (sorry just wanted to write the program)
  ##3. Bad name (Just wanted to finish this..)
  ##4. Not the ruby way, follows a more java style
  ##More TBA

  #Fixes:
  ##.....TBA
  ##Add this to read me instead
  #Positives:
  ##1. Easy to read, understand, interpret

  high = 0
  buy_date = 0
  sell_date = 0
  ((prices.length)-1).times do |b|
    buy = prices[b]
    ((b+1)...prices.length).each do |s|
      sell = prices[s]
      profit = sell-buy
      if profit > high
        buy_date = b
        sell_date = s
        high = profit
      end
    end
  end
  return [buy_date,sell_date]

end

p stock_picker([17,3,6,9,15,8,6,1,10])