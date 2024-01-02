def calculate_score(x, y)
  score = y - x
  case score
  when -4
    'コンドル' if x == 5
  when -3
    if y == 1
      'ホールインワン'
    else
      'アルバトロス'
    end
  when -2
    if y == 1
      'ホールインワン'
    else
      'イーグル'
    end
    # 'イーグル' if y == 1
  when -1
    'バーディ'
  when 0
    'パー'
  when 1
    'ボギー'
  when 2..Float::INFINITY
    "#{score}ボギー"
  end
end

# 入力を受け取る
lines = []
2.times { lines << gets.chomp.split(",") }

# 各ホールのスコアを計算して出力
result = []
(0..17).each do |i|
  x = lines[0][i].to_i
  y = lines[1][i].to_i

  result << calculate_score(x, y)
end

# 結果をカンマ区切りで出力
puts result.join(',')