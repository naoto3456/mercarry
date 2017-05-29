# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: 'emy', email:'emy@mercarry.com', description:'hello!!', password: 'emyemy')
User.create(name: 'tom', email:'tom@mercarry.com', description:'hello!!', password: 'tomtom')
User.create(name: 'lee', email:'lee@mercarry.com', description:'hello!!', password: 'leelee')

Categoryl1.create(name: 'woman')
Categoryl1.create(name: 'man')
Categoryl1.create(name: 'kids')
Categoryl1.create(name: 'home')
Categoryl1.create(name: 'vintage_collection')
Categoryl1.create(name: 'beauty')
Categoryl1.create(name: 'electronics')
Categoryl1.create(name: 'sports_outdoors')
Categoryl1.create(name: 'handmade')
Categoryl1.create(name: 'other')


Categoryl2.create(categoryl1_id: 1, name: 'dress')
Categoryl2.create(categoryl1_id: 1, name: 'jeens')
Categoryl2.create(categoryl1_id: 1, name: 'skirts')
Categoryl2.create(categoryl1_id: 2, name: 'tops')
Categoryl2.create(categoryl1_id: 2, name: 'pants')
Categoryl2.create(categoryl1_id: 2, name: 'shorts')


Listing.create(categoryl1_id: 1, categoryl2_id: 1, seller_id:1, name:'old red dress', description: 'this is not sold now', condition: 1, price: 30,  shipping_paid_by:1,  status:1)
Listing.create(categoryl1_id: 2, categoryl2_id: 2, seller_id:2, name:'blue pants', description: 'this is very nice', condition: 3, price: 45,  shipping_paid_by:2,  status:1)
Listing.create(categoryl1_id: 1, categoryl2_id: 1, seller_id:3, name:'white dress', description: 'excellent', condition: 2, price: 100,  shipping_paid_by:2,  status:1)
