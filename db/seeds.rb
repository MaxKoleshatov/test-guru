# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create!([{name: "Макс", email: "maks@gmail"}, {name: "Денис", email: "den@gmail"}, {name: "Павел", email: "pav@gmail"}])

categories = Category.create!([{title: "Спорт"}, {title: "История"}, {title: "Кино"}])

tests = Test.create!([
    {title: "Футбол", level: "1", category: categories[0], author: users[0]},
    {title: "Наполеон", level: "3", category: categories[1], author: users[1]},
    {title: "Оскар", level: "5", category: categories[2], author: users[2]}
])

questions = Question.create!([
    {body: "Какая страна была первым ЧМ по футболу?", test: tests[0]},
    {body: "Какая страна является последним ЧМ по футболу?", test: tests[0]},
    {body: "Сколько замен можно сделать в официальном футбольном матче?", test: tests[0]},
    {body: "В каком году родился Наполеон Бонапарт?", test: tests[1]},
    {body: "В каком городе родился Наполеон Бонапарт?", test: tests[1]},
    {body: "В каком году Наполеон Бонапарт был провозглашен императором?", test: tests[1]},
    {body: "В каком городе проходит церемония награждения премией Оскар?", test: tests[2]},
    {body: "В каком году создана премия Оскар?", test: tests[2]},
    {body: "По скольки номинациям вручается премия Оскар?", test: tests[2]}
])

answers = Answer.create!([
    {text: "Аргентина", correct: false, question: questions[0]},
    {text: "Португалия", correct: false, question: questions[0]},
    {text: "Уругвай", correct: true, question: questions[0]},
    {text: "Франция", correct: false, question: questions[1]},
    {text: "Англия", correct: false, question: questions[1]},
    {text: "Италия", correct: true, question: questions[1]},
    {text: "3", correct: true, question: questions[2]},
    {text: "5", correct: false, question: questions[2]},
    {text: "4", correct: false, question: questions[2]},
    {text: "1753", correct: false, question: questions[3]},
    {text: "1769", correct: true, question: questions[3]},
    {text: "1771", correct: false, question: questions[3]},
    {text: "Париж", correct: false, question: questions[4]},
    {text: "Бордо", correct: false, question: questions[4]},
    {text: "Аяччо", correct: true, question: questions[4]},
    {text: "1779", correct: false, question: questions[5]},
    {text: "1804", correct: true, question: questions[5]},
    {text: "1803", correct: false, question: questions[5]},
    {text: "Бостон", correct: false, question: questions[6]},
    {text: "Вашингтон", correct: false, question: questions[6]},
    {text: "Лос-Анжелес", correct: true, question: questions[6]},
    {text: "1929", correct: true, question: questions[7]},
    {text: "1928", correct: false, question: questions[7]},
    {text: "1934", correct: false, question: questions[7]},
    {text: "20", correct: false, question: questions[8]},
    {text: "26", correct: false, question: questions[8]},
    {text: "24", correct: true, question: questions[8]},
])
