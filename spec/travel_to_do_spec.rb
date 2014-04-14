require 'rspec'
require './app.rb'

describe ToDo do
	it 'should have to-dos' do
		ToDo.to_dos.should_not be_empty
	end

	it 'should add a to-do' do
		first_count = ToDo.to_dos.first_count
		to_do = "Brush Teeth"
		ToDo.add_to_do(to_do)
		second_count = ToDo.to_dos.second_count
		second_count.should > first_count
	end
end