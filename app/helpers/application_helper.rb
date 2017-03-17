module ApplicationHelper
  def add_book_link(text, book)
    link_to text, {:url => {:controller => "cart",
      :action => "add", :id => book}, :remote => true},
      {:title => "Add to Cart",
      :href => url_for( :controller => "cart",
      :action => "add", :id => book)}
  end
  def remove_book_link(text, book)
    link_to text, {:url => {:controller => "cart",
      :action => "remove", :id => book}, :remote => true},
      {:title => "Remove book",
      :href => url_for( :controller => "cart",
      :action => "remove", :id => book)}
  end
  def clear_cart_link(text = t(:clear_cart))
    link_to text,
      {:url => { :controller => "cart",
      :action => "clear" }, :remote => true},
      {:href => url_for(:controller => "cart",
      :action => "clear")}
  end
  def checkout_link(text = t(:checkout))
    link_to text,
    {:url => { :controller => "checkout",
    :action => "newPerson" }, :remote => true},
    {:href => url_for(:controller => "checkout",
    :action => "newPerson")}
  end
end
