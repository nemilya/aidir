require 'sinatra'
require 'json'
require 'securerandom'

$requests = []

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/api/requests' do
  content_type :json
  $requests.to_json
end

post '/api/requests' do
  content_type :json
  request_data = JSON.parse(request.body.read)
  new_request = {
    id: SecureRandom.uuid,
    title: request_data['title'],
    prompt: request_data['prompt'],
    files: request_data['files']
  }
  $requests << new_request
  new_request.to_json
end

put '/api/requests/:id' do
  content_type :json
  request_data = JSON.parse(request.body.read)
  request_id = params[:id]
  existing_request = $requests.find { |r| r[:id] == request_id }
  halt 404, { message: 'Request Not Found' }.to_json unless existing_request

  existing_request[:title] = request_data['title']
  existing_request[:prompt] = request_data['prompt']
  existing_request[:files] = request_data['files']
  existing_request.to_json
end

delete '/api/requests/:id' do
  request_id = params[:id]
  $requests.reject! { |r| r[:id] == request_id }
  status 204
end

get '/api/requests/:id' do
  content_type :json
  request_id = params[:id]
  existing_request = $requests.find { |r| r[:id] == request_id }
  halt 404, { message: 'Request Not Found' }.to_json unless existing_request

  existing_request.to_json
end

post '/api/requests/:id/proceed' do
  content_type :json
  request_id = params[:id]
  existing_request = $requests.find { |r| r[:id] == request_id }
  halt 404, { message: 'Request Not Found' }.to_json unless existing_request

  result = "AI response based on the prompt: '#{existing_request[:prompt]}' and selected files: #{existing_request[:files].join(', ')}."
  { result: result }.to_json
end

