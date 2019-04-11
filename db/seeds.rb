

SalesAdvisor.destroy_all
puts 'destroy all SalesAdvisors'
puts 'creating 7 sales advisors'
direction = SalesAdvisor.create(name: "Direction")
fourreau = SalesAdvisor.create(name: "J. Fourreau")
matillon = SalesAdvisor.create(name: "P. Matillon")
galner = SalesAdvisor.create(name: "P. Galner")
abrial = SalesAdvisor.create(name: "B. Abrial")
marsella = SalesAdvisor.create(name: "D. Marsella")
ribourg = SalesAdvisor.create(name: "H. Ribourg")

Description.destroy_all
puts 'destroy all Description'
puts 'creating good Description'
Description.create(name: '7700LH')
Description.create(name: '7900LHC')
Description.create(name: '7900LH')
Description.create(name: '7900LAH')
Description.create(name: '8600 12m50')
Description.create(name: '8600 13m20')
Description.create(name: '8900 12m20')
Description.create(name: '8900 13m')
Description.create(name: '8900 14m90')
Description.create(name: '8900LE 12m')
Description.create(name: '8900LE 13m')
Description.create(name: '8900LE 13m70')
Description.create(name: '8900LE 14m70')
Description.create(name: '9500H 12m30')
Description.create(name: '9500H 13m10')
Description.create(name: '9700H 12m30')
Description.create(name: '9700H 13m50 Carrus')
Description.create(name: '9700HD 12m30')
Description.create(name: '9700LHD 13m')
Description.create(name: '9700LHD 13m80')
Description.create(name: '9900HD 12m30')
Description.create(name: '9900LHD 13m')
Description.create(name: '9900LHD 13m80')
Description.create(name: 'VO')
Description.create(name: 'B5TL')
Description.create(name: 'B8R')
Description.create(name: 'B8RLE')
Description.create(name: 'B11R')

OrderBook.destroy_all
puts 'destroy all OrderBook'
puts 'creating the good OrderBook'
OrderBook.create(name: 'OB')
OrderBook.create(name: 'HOB')
OrderBook.create(name: 'Prévi')
OrderBook.create(name: 'Next Y')
OrderBook.create(name: 'OB VO')
OrderBook.create(name: 'OB VO ex démo')

Type.destroy_all
puts 'destroy all type'
puts 'creating the good type'
Type.create(name: '7705LH')
Type.create(name:'7905LAH')
Type.create(name:'7905LH')
Type.create(name:'7900E')
Type.create(name:'7900LHC')
Type.create(name:'8608R')
Type.create(name:'8908R')
Type.create(name:'8908RLE')
Type.create(name:'9508R')
Type.create(name:'9509R')
Type.create(name:'9711R')
Type.create(name:'9711R Carrus')
Type.create(name:'9M11R')
Type.create(name:'9911R')
Type.create(name:'9H11R')
Type.create(name:'9912B')
Type.create(name:'Autre VO')
Type.create(name:'B5TL')
Type.create(name:'B8R')
Type.create(name:'B8RLE')
Type.create(name:'B11R')

User.destroy_all
puts 'destroy all user'
puts 'creating one user'
User.create(email: 'gturcat@me.com', password: '123456')


