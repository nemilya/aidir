require 'sinatra'
require 'json'
require_relative 'config/environment'
require_relative 'models/request'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/api/requests' do
  content_type :json
  Request.all.to_json
end

post '/api/requests' do
  content_type :json
  request_data = JSON.parse(request.body.read)
  new_request = Request.create(
    title: request_data['title'],
    prompt: request_data['prompt'],
    files: request_data['files']
  )
  new_request.to_json
end

put '/api/requests/:id' do
  content_type :json
  request_data = JSON.parse(request.body.read)
  existing_request = Request.find_by(id: params[:id])
  halt 404, { message: 'Request Not Found' }.to_json unless existing_request

  existing_request.update(
    title: request_data['title'],
    prompt: request_data['prompt'],
    files: request_data['files']
  )
  existing_request.to_json
end

delete '/api/requests/:id' do
  existing_request = Request.find_by(id: params[:id])
  halt 404, { message: 'Request Not Found' }.to_json unless existing_request

  existing_request.destroy
  status 204
end

get '/api/requests/:id' do
  content_type :json
  existing_request = Request.find_by(id: params[:id])
  halt 404, { message: 'Request Not Found' }.to_json unless existing_request

  existing_request.to_json
end

post '/api/requests/:id/proceed' do
  content_type :json
  existing_request = Request.find_by(id: params[:id])
  halt 404, { message: 'Request Not Found' }.to_json unless existing_request

  result = "AI response based on the prompt: '#{existing_request.prompt}' and selected files: #{existing_request.files.join(', ')}."

  existing_request.update(result: result)

  { result: result }.to_json
end

