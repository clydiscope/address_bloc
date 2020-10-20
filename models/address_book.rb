#!/usr/bin/ruby

require_relative 'entry' #a convenient substitute of require that assumes a relative path

	class AddressBook
		attr_reader :entries

		def initialize
			@entries = []
		end
	
	
		def add_entry(name, phone_number, email)
			index = 0
			entries.each do |entry|
				if name < entry.name
					break # allows you to step out of the block
				end
				index += 1
			end
			entries.insert(index, Entry.new(name, phone_number, email))
		end
	end