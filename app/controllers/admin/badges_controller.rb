class Admin::BadgesController < Admin::BaseController

    before_action :find_badge, only: %i[show destroy]

    def index
        @badges = Badge.all
      end
    
    def new
        @badge= Badge.new
      end

      def show; end

      def edit
        @badge = Badge.find(params[:id])
      end

      def update
        @badge = Badge.find(params[:id])
    
        if @badge.update(badge_params)
          redirect_to admin_badges_path(@badge)
        else
          render :edit
        end
      end
  
    def create
      @badge = Badge.new(badge_params)
      
  
      if @badge.save
        redirect_to admin_badges_path
      end
    end

    def destroy
        @badge.destroy
    
        redirect_to admin_badges_path
      end

    private

 

  def find_badge
    @badge = Badge.find(params[:id])
  end
  
#     def edit
#       @test = Test.find(params[:id])
#     end
  
#     def update
#       @test = Test.find(params[:id])
  
#       if @test.update(test_params)
#         redirect_to admin_test_path(@test)
#       else
#         render :edit
#       end
#     end
  
#     def update_inline
#       @test = Test.find(params[:id])
      
#       if @test.update(test_params)
#         redirect_to admin_tests_path
#       else
#         render :index
#       end
#     end
  
#     def destroy
#       @test.destroy
  
#       redirect_to admin_tests_path
#     end
  
#     private
  
#     def set_tests
#       @tests = Test.all
#     end
  
#     def find_test
#       @test = Test.find(params[:id])
#     end
  
    def badge_params
      params.require(:badge).permit(:title, :image, :rules, :options)
    end
  end