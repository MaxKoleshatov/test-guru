module QuestionsHelper
    def question_header(question)
      if question.new_record?
        render plain: "Create New #{@test.title} Question"
      else
        render plain: "Edit #{@question.test.title} Question"
      end
    end
end
