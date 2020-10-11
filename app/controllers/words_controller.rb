class WordsController < ApplicationController
  def index
    @words= Word.all
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update(lt: params[:lt], de: params[:de])
      flash[:success] = 'Gespeichert'
    end
    redirect_to words_path
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(lt: params[:lt], de: params[:de])
    if @word.save
      flash[:success] = 'Gespeichert'
    end
    redirect_to words_path
  end
end
