#!/usr/bin/env ruby
require 'httparty'

domain = "https://www.google.com"
domain_wrong = "https://www.goo.ll.co.com.zz"

# first checks - does domain resolve and can we reach it
def domain_resolves(domain)
  url = domain
  begin
    response = HTTParty.get(url)
    response.success? || response.code == 301 || response.code == 302
  rescue SocketError, HTTParty::Error, StandardError
    false
  end
end

puts domain_resolves(domain)
puts domain_resolves(domain_wrong)

# get cookie values
def get_cookies(x)
end