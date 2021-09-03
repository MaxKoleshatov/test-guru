module ApplicationHelper
    def github_url(author, repo)
      link_to "Проект", "https://github.com/#{author}/#{repo}", target: '_blank'
    end
    
    def current_year
      Date.current.year
    end
    
end

