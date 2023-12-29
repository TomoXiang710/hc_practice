members = %w[A B C D E F]

# .sample（n)メソッドで配列オブジェクトから無作為に任意の個数の要素を取り出す
# rand(n)で最大n個未満の要素を返す
group1 = members.sample(2 + rand(3))
# group1の人数が決まれば差し引きでもう一グループが決まる
group2 = members - group1

p group1.sort
p group2.sort