class WhatToDo

  def initialize (output)
    @output = output  
    what_to_do  
  end

  def write_file
    IO.write("log.log", text)
  end

  def add_queue
    Queue.put(text)
  end

  def post_http
    HTTP.post(text)          
  end

  def add_logstach
      Logstash.add(text)
  end

  def new_logWatch
     LogWatch.new.post(text)
  end

  def what_to_do
    
    case @output

      when :logfile
        write_file
      when :message_queue
        add_queue
      when :json_endpoint
        post_http
      when :logstash
        add_logstach
      when :LogWatch
        new_logWatch
    
    end
  
  end

end




