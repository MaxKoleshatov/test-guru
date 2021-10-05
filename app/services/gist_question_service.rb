class GistQuestionService

  STATUS_CODE = 201

  Result = Struct.new(:url, :status_code) do
    def success?
      status_code == STATUS_CODE
    end
  end


  def initialize(question, client:nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def call
    @client.create_gist(gist_params)
    Result.new(@client.last_response.data[:html_url], @client.last_response.status)
  end

  private

  def gist_params
    {
        description:"A question about #{@test.title} from TestGuru",
        files: {
            'test-guru-question.txt' => {
                content: gist_content
            }
        }
    }
end

  def gist_content
    content = [@question.body, *@question.answers.pluck(:text)].join("\n")
  end
end