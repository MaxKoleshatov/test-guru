# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create!([{name: "Макс"}, {name: "Денис"}, {name: "Павел"}])

categories = Category.create!([{title: "Спорт"}, {title: "История"}, {title: "Кино"}])

tests = Test.create!([
    {title: "Футбол", level: "1", category_id: categories[0].id, author_id: users[0].id},
    {title: "Наполеон", level: "3", category_id: categories[1].id, author_id: users[1].id},
    {title: "Оскар", level: "5", category_id: categories[2].id, author_id: users[2].id}
])

questions = Question.create!([
    {body: "Какая страна была первым ЧМ по футболу?", test_id: tests[0].id},
    {body: "Какая страна является последним ЧМ по футболу?", test_id: tests[0].id},
    {body: "Сколько замен можно сделать в официальном футбольном матче?", test_id: tests[0].id},
    {body: "В каком году родился Наполеон Бонапарт?", test_id: tests[1].id},
    {body: "В каком городе родился Наполеон Бонапарт?", test_id: tests[1].id},
    {body: "В каком году Наполеон Бонапарт был провозглашен императором?", test_id: tests[1].id},
    {body: "В каком городе проходит церемония награждения премией Оскар?", test_id: tests[2].id},
    {body: "В каком году создана премия Оскар?", test_id: tests[2].id},
    {body: "По скольки номинациям вручается премия Оскар?", test_id: tests[2].id}
])

answers = Answer.create!([
    {text: "Аргентина", correct: false, question_id: questions[0].id},
    {text: "Португалия", correct: false, question_id: questions[0].id},
    {text: "Уругвай", correct: true, question_id: questions[0].id},
    {text: "Франция", correct: false, question_id: questions[1].id},
    {text: "Англия", correct: false, question_id: questions[1].id},
    {text: "Италия", correct: true, question_id: questions[1].id},
    {text: "3", correct: true, question_id: questions[2].id},
    {text: "5", correct: false, question_id: questions[2].id},
    {text: "4", correct: false, question_id: questions[2].id},
    {text: "1753", correct: false, question_id: questions[3].id},
    {text: "1769", correct: true, question_id: questions[3].id},
    {text: "1771", correct: false, question_id: questions[3].id},
    {text: "Париж", correct: false, question_id: questions[4].id},
    {text: "Бордо", correct: false, question_id: questions[4].id},
    {text: "Аяччо", correct: true, question_id: questions[4].id},
    {text: "1779", correct: false, question_id: questions[5].id},
    {text: "1804", correct: true, question_id: questions[5].id},
    {text: "1803", correct: false, question_id: questions[5].id},
    {text: "Бостон", correct: false, question_id: questions[6].id},
    {text: "Вашингтон", correct: false, question_id: questions[6].id},
    {text: "Лос-Анжелес", correct: true, question_id: questions[6].id},
    {text: "1929", correct: true, question_id: questions[7].id},
    {text: "1928", correct: false, question_id: questions[7].id},
    {text: "1934", correct: false, question_id: questions[7].id},
    {text: "20", correct: false, question_id: questions[8].id},
    {text: "26", correct: false, question_id: questions[8].id},
    {text: "24", correct: true, question_id: questions[8].id},
])
