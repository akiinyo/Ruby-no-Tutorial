hands = %w(パー グー チョキ)

puts hands.shuffle.first

# 回答1 janken = rand(3), if文で
# 回答2 case文で
# 回答3 配列にして添字をランダム
# 回答4 puts %w(パー グー チョキ).sample 引数を与えると何個か取れる
