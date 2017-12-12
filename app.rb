# Sinatra 베이스의 앱을 만든다.
require 'sinatra'


# 2. 로또 번호 추천 사이트를 만든다.
# - get '/' {} : '로또 추천 번호'라는 버튼을 만들고 -> '/lotto'
# - get '/lotto' {} : 로또 번호를 추천하는데,
# 매번 추천된 번호를 lootto.txt 파일에 저장을 한다.
get '/'  do
	erb :index
end

get '/lotto'  do
  @result = (1..45).to_a.sample(6)

  File.open("lotto.txt", "a+") do |f|
    f.write(@result)
    f.write("\n")
  end

	erb :lotto
end
