class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(name: params[:pet_name], owner_id: params[:owner_id])
    if !params[:owner_name].empty?
      @pet.owner = Owner.create(name: params[:owner_name])
      @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do 
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    # if !params.keys.include?("owner_id")
    #   params[:pet][:owner_id] = []
    #   end
   
      @pet = Pet.find(params[:id])
      @pet.update(name: params[:pet_name], owner_id: params[:owner][:name])
      if !params[:owner_name].empty?
        @pet.owner = Owner.create(name: params[:owner_name])
        @pet.save
      end

    redirect to "pets/#{@pet.id}"
  end
end