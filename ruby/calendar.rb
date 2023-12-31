require 'date'
require 'optparse'

this_year = Date.today.year
params = ARGV.getopts('m:') 

#引数の月、引数がなければ今月
month = (params['m'] || Date.today.month).to_i
year = (Date.today.year).to_i

if month < 1 || month > 12
  puts "#{month} is neither a month number (1..12) nor a name"
  exit  # プログラムを終了する
end

# 月と年を中央揃えで表示
puts "#{month}月 #{year}".center(20)

# 曜日列を表示
puts "Mo Tu We Th Fr Sa Su "

first_day = Date.new(this_year, month, 1) #引数の月、引数がなければ今月
last_day = Date.new(this_year, month, -1) #上と同じく

# 月初めの曜日に合わせて空白を出力
(first_day.cwday-1).times { print " " * 3 } # 4つのスペース（1週間の最大曜日数）

def color_reverse(text)
  "\e[7m\e[30m#{text}\e[0m"
end

# １日〜月末日を出力
(first_day..last_day).each do |date|
  
  if date == Date.today
    print color_reverse(date.day).rjust(14)
  else
    print date.day.to_s.rjust(2)
  end

  print " "

  # 曜日が日曜日の場合、改行
  puts "\n" if date.cwday == 7
end






