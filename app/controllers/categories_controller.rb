class CategoriesController < ApplicationController
  def id2
    @items = Item.where(category_id: 2).order('created_at DESC')
  end

  def id3
    @items = Item.where(category_id: 3).order('created_at DESC')
  end

  def id4
    @items = Item.where(category_id: 4).order('created_at DESC')
  end

  def id5
    @items = Item.where(category_id: 5).order('created_at DESC')
  end

  def id6
    @items = Item.where(category_id: 6).order('created_at DESC')
  end

  def id7
    @items = Item.where(category_id: 7).order('created_at DESC')
  end

  def id8
    @items = Item.where(category_id: 8).order('created_at DESC')
  end

  def id9
    @items = Item.where(category_id: 9).order('created_at DESC')
  end

  def id10
    @items = Item.where(category_id: 10).order('created_at DESC')
  end
end
