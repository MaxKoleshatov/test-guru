module QuestionsHelper
    def question_header(question)
        if question.new_record?
            p "Create New #{@test.title} Question"
        else
            p "Edit #{@question.test.title} Question"
    end
end
end
