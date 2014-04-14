# File that handles entire operation
require 'sinatra'

# Allows code to show in browser 
# Use local:(port# assigned in terminal)
get "/" do 
	"Hello World"
end

# # Use local:(port# assigned in terminal)/love
# get "/love" do
# 	"Love"
# end

# # Use local:(port# assigned in terminal)/yippee
# get "/yippee" do
# 	"Whooooo"
# end

# get "/to_dos" do # Looks for the 'to_do' file
# 	erb :"to_dos/index" # Run in browser with localhost:xxx/to_dos, erb is an html file
# end

get "/travel_to_dos" do
	# @to_dos = ["Feed dog", "Do laundry"] (moved to class ToDo)
	@to_dos = ToDo.to_dos
	erb :"travel_to_dos/index"
end

get "travel_to_dos" do
	text = params[:description]
	type_of_task = params[:category]
	erb :"travel_to_dos/index"
end

# get "/travel_to_dos" do
# 	type_of_task = params[:category]
# 	erb :"travel_to_dos/index"
# end

post "/travel_to_dos" do
	task_list = "#{params[:description]}, #{params[:category]}"
	# text = params[:description] # Looks for input field with id=description
	if ToDo.add_to_do(task_list)
		#redirect erb :"to_dos/index" # Redirect to a 'get' url to retrieve from url file
		redirect "/travel_to_dos"
	else
		redirect "/"
	end
end

class ToDo
	@@to_dos = []


	def initialize(description, category)
		@user_task = description
		@user_category = category
	end

	def self.to_dos
		@@to_dos
	end

	def self.add_to_do(to_do)
		if @user_category == "high"
		@@to_dos.push(to_do)
		# @@to_dos << to_do  is another way to write the above
	end

	# def self.radio_button(tag_value)
	# 	Tags::RadioButton.new(tag_value).render
	# end
end