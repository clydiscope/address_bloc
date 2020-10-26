#!/usr/bin/ruby

require_relative 'entry' #a convenient substitute of require that assumes a relative path
require "csv"

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
		
		def import_from_csv(file_name)
			csv_text = File.read(file_name)
			csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
			
			csv.each do |row|
				row_hash = row.to_hash
				add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
			end
		end
		
		def binary_search(name)
			lower = 0
			upper = entries.length - 1
			
			while lower <= upper
				mid = (lower + upper) / 2
				mid_name = entries[mid].name
				
				if name == mid_name
					return entries[mid]
				elsif name < mid_name
					upper = mid - 1
				elsif name > mid_name 
					lower = mid + 1
				end
			end
			return nil
		end
	end