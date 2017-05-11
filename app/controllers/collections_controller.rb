class CollectionsController < ApplicationController

  access_resource :user
  access_resource :collection, columns: [:title, :description]

  def show
    user
    collection
  end

  def new
    user
    collection
  end

  def create
    collection.user = user
    collection.save
    respond_with collection, location: -> { user_collection_path(user, collection) }
  end

end
