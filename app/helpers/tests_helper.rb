module TestsHelper
    def test_header(test)
        if test.new_record?
          render plain: "Create New #{test.title} Test"
        else
          render plain: "Edit #{test.title} Test"
        end
    end
end

