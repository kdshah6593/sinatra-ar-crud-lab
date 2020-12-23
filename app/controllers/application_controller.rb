
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  patch '/articles/:id' do
    @article2 = Article.find(params[:id])
    @article2.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article2.id}"
  end

  get '/articles/:id/edit' do
    @article_edit = Article.find(params[:id])
    erb :edit
  end

  delete '/articles/:id' do
    @article_delete = Article.find(params[:id])
    @article_delete.destroy
    redirect "/articles"
  end
end
