  SCORE_MAPPING = {
  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  0  => 'パー',
  1  => 'ボギー'
}

# 入力を受け取る
par = gets.chomp.split(',').map(&:to_i)
stroke = gets.chomp.split(',').map(&:to_i)

# 結果を格納する配列
result = []

# 各ホールのスコアを計算して出力
(0..17).each do |i|
  x = par[i]
  y = stroke[i]
  score = y - x
  if (y == 1 && x == 4) || (y == 1 && x == 3)
    result << 'ホールインワン'
    next
  end

  if score > 1
    result << "#{score}ボギー" 
  else
    result << SCORE_MAPPING[score]
  end
end

# 結果をカンマ区切りで出力
puts result.join(',')