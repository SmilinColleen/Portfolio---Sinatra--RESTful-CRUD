
get '/' do
  # Look in app/views/index.erb
  redirect '/notes'
end

get '/notes' do #index of the model to display all notes
  @notes = Note.all
  erb :notes
end

get '/notes/new' do #gives you the form to create a new one
  erb :new
end

post '/notes' do #create new note (title and content)
  Note.create(params)
  @notes = Note.all
  redirect '/notes'
end

get '/notes/:id' do # displays a specific note

end


get '/notes/:id/edit' do #returns form for editing for specific note (edit has 2 pieces)
  @note = Note.find(params[:id])
  erb :edit
end

put '/notes/:id' do #updates specific note
  note = Note.find(params[:id])
  note.update_attributes(title: params[:title], content: params[:content])
  redirect '/notes'
end

delete '/notes/:id' do # deletes specific note
  note = Note.find(params[:id])
    note.destroy
  redirect '/notes'
end
