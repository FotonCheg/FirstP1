class PagesController < ApplicationController
  def welcome
    @first_var = 'Hi my dear friend, it is Ruby tutorial'

    @article_from_db = Article.all #Достали все статьи из БД и записали в переменную

    #Бежим по всем статьям и достаем из них данные
    @article_from_db.each do |elem|
      @first_var + elem.title + " " + elem.body #почему-то не добавляет данные в переменную. Я что-то читал про то, что переменные внутри блока могут странно себя вести
      puts elem.title + " " + elem.body
    end
  end

  #Это метод, который доступен по пути /create_new_article и если мы передаем ему параметры http://localhost:3000/create_new_articles?title=Yaroslav&body=Dyachenko, то они пишутся в бд
  def create_new_article
    Article.create(title:params[:title], body:params[:body])
  end
end

