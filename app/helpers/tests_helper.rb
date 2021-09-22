module TestsHelper
  def test_header(test)
    if test.new_record?
      t('.test')
    else
      "Edit #{test.title} Test"
    end
  end
end

