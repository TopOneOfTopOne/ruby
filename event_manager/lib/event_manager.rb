require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = 'e179a6973728c4dd3fb1204283aaccb5'
def clean_zipcode(zip_code)
	zip_code.to_s.rjust(5,'0')[0..4]
end

def legislator_names_by_zipcode(zipcode)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
	
end

def save_letter(letter, id)
	Dir.mkdir 'outputs' # unless Dir.exists?('output')
	fname = "output/thankyou_#{id}.html"
	File.open(fname,'w') do |f|
		f.puts letter
	end
end

template_letter = File.read 'form_letter.erb'
erb_template = ERB.new template_letter
contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
contents.each do |row|
	first_name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislator_names_by_zipcode(zipcode)
	form_letter = erb_template.result(binding)
	save_letter(form_letter,row[0])
	puts 'added'
end

