  class UsersAverage


    def votes_down user
              
       user.each do |user|
          @d=0

          user.posts.each do |post|
           @d=post.cached_votes_down + @d
          end
          @result=User.find(user.id)
          @total=@result.update(votes_down: "#{@d}")

       end        
    end


    def votes_up user
              
       user.each do |user|
          @u=0

          user.posts.each do |post|
           @u=post.cached_votes_up + @u
          end
          @result=User.find(user.id)
          @total=@result.update(votes_up: "#{@u}")
          
       end        
    end


    def average_rating user
              
       user.each do |user|
        @r=0
          
        if user.posts.any?

          user.posts.each do |post|
             
            @r=post.cached_weighted_average + @r
            @rating=@r / user.posts.count

          end

        else
          @rating=user.average_rating
        end
         
          @rating=@rating.round(2)

          @result=User.find(user.id)
          @total=@result.update(average_rating: "#{@rating}")
                                              
       end        
    end


  end




