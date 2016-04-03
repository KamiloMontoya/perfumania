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

Category.create(id: 1, name: "Fragancias Maculinas")
Category.create(id: 2, name: "Fragancias Femeninas")
Category.create(id: 3, name: "Otras Productos")

#Usuario por defecto perfumaniashop@gmail.com, passw: perfumania2016*

user = User.new(
  :email                 => "perfumaniashop@gmail.com",
  :password              => "perfumania2016*",
  :password_confirmation => "perfumania2016*"
)
user.save!