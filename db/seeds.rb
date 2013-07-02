# encoding: utf-8

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'Name: ' << user.name

puts 'DEFAULT PROJECTS FOR:' << user.name
projects = [{ name: "Lorem ipsum", description: "Aenean commodo ligula eget dolor. Aenean massa." },
            { name: "Dolor sit amet", description: "Curabitur ullamcorper ultricies nisi. Nam eget dui." },
            { name: "弁予編月付問質", description: "溛滁 鶟儹巏 傎圌媔 壾, 娭屔 廲籗糴 稨窨箌 鳼, 溿煔 滍 幋暕楋 錌雔 薋薉, 齹鑶鸓 螏螉褩 齞齝囃 穊" },
            { name: "クちン決", description: "䦤婩ぷ 䋯フェ 䰥ぶらあ䤦 アびゃウォけ極 荤蟤㨣滥榯, 褚たう騟にゃ ず秦穤マフィェ 坩䨯褚 騌廨 蝣バ 䩎穟ペ 駌きゅヒェ娩みゃ ず秦穤マフィェ 㫨韦ヂャの覜" },
            { name: "피고인의 자백", description: "소리, 빠지지 전에 타시랍시요. 돈은 좁쌀 빽빽 과한데. 인생의 안 잔 깎듯이 쳤다. 내며, 있음으로써 청춘은 피다. 앓는 난 학생은 뭉게뭉게 제 날이었다." }]
projects.each do |p|
  Estimate.find_or_create_by project: p[:name] do |fields|
    fields.description =  p[:description]
    fields.user = user
    puts 'Name: ' << p[:name]
  end
end
