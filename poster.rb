require 'net/http'

uri = URI 'http://damp-taiga-5083.herokuapp.com/datum/new'
res = Net::HTTP.post_form uri, :body => ARGV.join(' ')
puts res.body
