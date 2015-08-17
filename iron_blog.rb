class Blog
    def initialize (name)
    	@container = []
    	@name = name
    end
    def publish_front_page
    	@container.each do |item|
    		if item.sponsored == "yes"
    		  puts "******Post title #{item.date}******"
    		else 
    		  puts "Post title #{item.date}"
    		  puts "***********************"
    		end 		
    		  puts "Post text #{item.title}"
    		  puts "-----------------------"
    	end
    end
    def sort  #sorts it
    	@container = @container.sort_by {|value| value.date} # save it!!!
    end

    def push(post)
    	@container << post
    end
end

class Post 
	attr_accessor :date, :text, :title, :sponsored
  def initialize(sponsored,title,date,text)
  	@sponsored = sponsored
  	@title = title
    @date = date
    @text = text
  end
end


blog = Blog.new("my_blog")    
el_pais = Post.new("yes","El Pais", 2, "paper")
el_mundo = Post.new("no","El Mundo",3,"paper")
el_periodico = Post.new("no","El Periodico",1,"paper")
the_economist = Post.new("no","The Economist",4,"magazine")
financial_times = Post.new("yes","Financial Times",5,"paper")
blog.push(el_pais)
blog.push(el_mundo)
blog.push(el_periodico)
blog.push(the_economist)
blog.push(financial_times)
blog.sort
blog.publish_front_page

    