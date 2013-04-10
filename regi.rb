print '何円の買い物をしましたか：'
price = gets.chomp.to_i

print '何円だしましたか：'
payment = gets.chomp.to_i

def print_change(price, payment)
  moneys = [10000, 5000, 1000, 500, 100, 50, 10, 5, 1]
  change = payment - price

  moneys.each do |m|
   puts "%s円：%s枚" %[m, change / m]
   change %= m
  end
end

if payment - price < 0
  puts 'お金が足りません！'
else
  puts '【お釣りの枚数】'
  print_change(price, payment)
end
