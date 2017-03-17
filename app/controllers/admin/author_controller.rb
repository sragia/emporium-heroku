class Admin::AuthorController < ApplicationController
  before_filter :authorize
  def new
    @author = Author.new
    @page_title = t(:create_new_author)
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:notice] = t(:author_created, :name => @author.name)
      redirect_to :action => 'index'
    else
      @page_title = t(:create_new_author)
      render :action => 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
    @page_title = t(:edit_author)
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      flash[:notice] = t(:author_succ_update)
      redirect_to :action => 'show', :id => @author
    else
      @page_title = t(:edit_author)
      render :action => 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    flash[:notice] = t(:author_destroy, :name => @author.name)
    @author.destroy
    redirect_to :action => 'index'
  end

  def show
    @author = Author.find(params[:id])
    @page_title = @author.name
  end

  def index
    @authors = Author.all
    @page_title = t(:author_list)
  end
end
