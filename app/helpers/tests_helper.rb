module TestsHelper
  def test_header(test)
    if test.new_record?
      I18n.t('.new_create_test')
    else
      I18n.t('.edit_test', title: test.title)
    end
  end
end

