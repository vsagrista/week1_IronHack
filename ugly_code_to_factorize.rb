if output == :screen
  puts text
elsif output == :logfile
  IO.write("log.log", text)
elsif output == :message_queue
  Queue.put(text)
elsif output == :json_endpoint
  HTTP.post(text)
elsif output == :logstash
  Logstash.add(text)
elsif output == :logwatcher
  LogWatch.new.post(text)
elsif output == :logfile
  IO.write("log.log", text)
elsif output == :message_queue
  Queue.put(text)
elsif output == :json_endpoint
  HTTP.post(text)
elsif output == :logstash
  Logstash.add(text)
elsif output == :logwatcher
  LogWatch.new.post(text)
elsif output == :logfile
  IO.write("log.log", text)
elsif output == :message_queue
  Queue.put(text)
elsif output == :json_endpoint
  HTTP.post(text)
end
Add Comment