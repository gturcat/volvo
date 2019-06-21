

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
User.create(email: 'claudia@wiese.com', password: '123456')
User.create(email: 'tiffany.juge@volvo.com', password: '123456')
User.create(email: 'michael.lanez@volvo.com', password: '123456')


Place.destroy_all
puts 'destroy all place'
puts 'creating place you need'
Place.create(city: 'VTC ROISSY (784433)', adress: 'ZAC Du Moulin-7 Rue du Noyer-Roissy en France-95735 CDG CEDEX 1')
Place.create(city: 'VTC MASSY (170373) (433570)', adress:'17 Bis Rue du Pérou-ZAC du Pérou-91300 MASSY' )
Place.create(city: 'VTC CHAPONNAY (31939)', adress:"150 Rue Edouard Herriot-Parc d'Affaires de la Vallée d'Ozon-69970 CHAPONNAY" )
Place.create(city: 'SAVI SEGUIN ANGERS (187098)', adress:"RN23-Les Perruches-49480 SAINT SYLVAN D'ANJOU")
Place.create(city: 'THEOBALD LUDRES (505825)', adress:'Lot Industriel du Franclos-54710 LUDRES' )
Place.create(city: 'THEOBALD SAINT NABORD (231355)', adress:"5 Rue de l'Ensencement-88200 SAINT NABORD" )
Place.create(city: 'THEOBALD SARREGUEMINES (789056)', adress:'ZI 10 Rue Joseph Cugnot-57200 SARREGUEMINES' )
Place.create(city: 'VTC RENNES (421683)', adress:'44 Rue de la Rigourdière-ZI de la rigourdière-35510 CESSON-SEVIGNE' )
Place.create(city: 'VTC NANTES (453163)', adress:'17 Rue des Piliers de la Chauvinière-44800 SAINT HERBLAIN' )
Place.create(city: 'VTC BORDEAUX (421685)', adress:'Rue Henri Delattre - ZI Bordeaux Fret-33520 BRUGES' )
Place.create(city: 'VTC TOULOUSE (498517)', adress:'3 Rue du Pardc-Parc Industyriel Euro Nord-31150 FENOUILLET' )
Place.create(city: 'VTC VANNES (508127)', adress:'ZI le Poteau-22 Rue Denis Papin-56890 SAINT-AVE' )
Place.create(city: 'VTC MARSEILLES (605105)', adress:'ZAC des Sybilles - BP 24-13730 SAINT VICTORET' )
Place.create(city: 'VTC ROUEN (965678)', adress:'5 Quai de France-76100 ROUEN' )
Place.create(city: 'VTC SORGUES (972444)', adress:'Boulevard Salvador Allende-84700 SORGUES (Avignon)' )
