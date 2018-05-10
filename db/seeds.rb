# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

deals = [{
    title: "Tonkotsu ramen",
    description: "Tonkotsu is specialized in pork bone noodle soup. Enjoy the best Ramen in Melbourne.",
    original_price: 15.0,
    offer_price: 10.0,
    expiry: "2018-05-08 12:09:00",
    quantity: 30,
    voucher_limit_per_user: 2,
    merchant_id: 1
},
{
    title: "California roll",
    description: "Momotaro offers authentic and affordable Sushi.The fresh and tasty meals are available to either eat in or takeaway.",
    original_price: 10.0,
    offer_price: 6.0,
    expiry: "2018-05-011 16:00:00",
    quantity: 30,
    voucher_limit_per_user: 2,
    merchant_id: 2
},
{
    title: "Free beer (Asahi)",
    description: "GOSAKU is a great place to eat, combining a cozy atmosphere with fresh-made traditional Japanese food. The mission is not only to have great tasting food, but have efficient and friendly service because customer satisfaction is paramount.",
    original_price: 10.0,
    offer_price: 0.0,
    expiry: "2018-05-011 16:00:00",
    quantity: 50,
    voucher_limit_per_user: 1,
    merchant_id: 3
},
{
    title: "pizza margherita",
    description: "Lead by our head chef of 14 years, we’ve managed to take home prestigious titles such as World’s Best Pizza and Australia’s Best Pizza… more than once! Be sure to stop in and try our beloved pizzas for yourself.",
    original_price: 15.0,
    offer_price: 7.0,
    expiry: "2018-05-011 16:00:00",
    quantity: 100,
    voucher_limit_per_user: 2,
    merchant_id: 4
},
{
    title: "maffin + coffee",
    description: "At the Bob and Angie, we're seriously passionate about good food and good coffee.Enjoy delicious, homemade baked treats, wonderful soups and lunches, and our famous all-day breakfast.",
    original_price: 10.0, 
    offer_price: 5.0,
    expiry: "2018-05-011 16:00:00",
    quantity: 50,
    voucher_limit_per_user: 1,
    merchant_id: 5
}
]

merchants = [{
    name: "Tonkotsu",
    description: "Tonkotsu is specialized in pork bone noodle soup. Enjoy the best Ramen in Melbourne.",
    street: "160 Russell Street",
    city: "Melbourne",
    state: "VIC",
    postcode: 0000,
    user_id: 1
},
{
    name: "Sushi Momotaro",
    description: "Momotaro offers authentic and affordable Sushi.The fresh and tasty meals are available to either eat in or takeaway.",
    street: "16 Toorak Road, South Yarra",
    city: "Melbourne",
    state: "VIC",
    postcode: 0000,
    user_id: 1
},
{
    name: "GOSAKU",
    description: "At IL PESCATORE our award winning chefs combine centuries of tradition with their own touches of innovation to present dishes guaranteed to bring a smile to your face.",
    street: "36 Little Bourke Street",
    city: "Melbourne",
    state: "VIC",
    postcode: 0000,
    user_id: 1
},
{
    name: "LA CASA",
    description: "Lead by our head chef of 14 years, we’ve managed to take home prestigious titles such as World’s Best Pizza and Australia’s Best Pizza… more than once! Be sure to stop in and try our beloved pizzas for yourself.",
    street: "294 Drummond Street",
    city: "Melbourne",
    state: "VIC",
    postcode: 0000,
    user_id: 1
},
{
    name: "Bob and Angie",
    description: "At the Bob and Angie, we're seriously passionate about good food and good coffee.Enjoy delicious, homemade baked treats, wonderful soups and lunches, and our famous all-day breakfast.",
    street: "120 & 123 Hardware Street",
    city: "Melbourne",
    state: "VIC",
    postcode: 0000,
    user_id: 1
}
]

users = [{
    email: "cam011819@coderacademy.edu.au",
    password: "123456"
},
{
    email: "example@example.com",
    password: "123456"
},
{
    email: "test@test.com",
    password: "123456"
}
]

User.create!(users) {|u| puts u.name}
Merchant.create!(merchants) {|m| puts m.name}
Deal.create!(deals) {|d| puts d.title}