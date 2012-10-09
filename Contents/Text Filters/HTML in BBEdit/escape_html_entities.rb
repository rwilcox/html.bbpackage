#!/usr/bin/env ruby

require 'cgi'
require 'rubygems'
require 'htmlentities'

coder = HTMLEntities.new
print coder.encode( ARGF.read, :named )
