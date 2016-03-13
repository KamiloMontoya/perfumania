# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Test.create(id: 1 ,name: "Descubre tu fragancia masculína", description: "Este facil test te ayudara a conocer que tipo de fragancia debes usar para realzar esa personalidad que te caracteriza. Al finalizar, cuenta las veces que se repiten tus respuestas y descubre, cual es la fragancia perfecta para ti.")

Question.create(id: 1, title: "¿Con qué color te identificas?", test_id: 1)

Answer.create(title: "Blanco", question_id: 1)
Answer.create(title: "Azul", question_id: 1)
Answer.create(title: "Rosa", question_id: 1)
Answer.create(title: "Rojo", question_id: 1)

Product.create(id: 1 ,name: "Bulgari", description: "Fragancia Bulgari", image_path: "/img/products/1.jpg", category_id: 1)
Product.create(id: 2 ,name: "Hugo Boss", description: "Fragancia Hugo Boss", image_path: "/img/products/2.jpg", category_id: 1)
Product.create(id: 3 ,name: "Bleu", description: "Fragancia Bleu de Chanel", image_path: "/img/products/3.jpg", category_id: 1)