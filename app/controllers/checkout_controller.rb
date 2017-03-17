class CheckoutController < ApplicationController
  before_filter :initialize_cart

  def newPerson
    if Person.exists?(:cartId => session[:cart_id])
      @person = Person.find_by_cartId(session[:cart_id])
    else
      @person = Person.new
    end
    @page_title = t(:person_info)
  end

  def personInfo
    if Person.exists?(:cartId => session[:cart_id])
      @person = Person.find_by_cartId(session[:cart_id])
      @person.update_columns(:first_name => params[:person][:first_name],
                                :last_name => params[:person][:last_name],
                                :email => params[:person][:email],
                                :phone_number => params[:person][:phone_number],
                                :address => params[:person][:address])
      redirect_to :action => 'shipedit'
    else
      @person = Person.create(person_params)
      @person.cartId = session[:cart_id]
      if @person.save
        redirect_to :action => 'shipedit'
      else
        @page_title = t(:person_info)
        render :action => 'newPerson'
      end
    end
    # -> shipping
  end
  def shipedit
    @person = Person.find_by_cartId(session[:cart_id])
    @page_title = t(:shipping)
  end
  def shipping
    #shipping methods
    @person = Person.find_by_cartId(session[:cart_id])
    if @person.update_attributes(:shipping => params[:shipping].split[0])
      @person.update_attributes(:shipprice => params[:shipping].split[1])
      redirect_to :action => 'paymentedit'
    else
      render :action => 'shipedit'
    end
    # -> payment
  end
  def paymentedit
    @person = Person.find_by_cartId(session[:cart_id])
    @page_title = t(:payment)
  end

  def payment
    # payment methods
    @person = Person.find_by_cartId(session[:cart_id])
    if @person.update_attributes(:payment => params[:payment])
      redirect_to :action => 'check' #check
    else
      render :action => 'paymentedit'
    end
    # -> check
  end

  def check
    #gather cart info and person info
    #confirm if everything is correct
    @person = Person.find_by_cartId(session[:cart_id])
    @cart = Cart.find(session[:cart_id])
    @page_title = t(:checkout)

    #-> confirm screen
  end

  def confirm
    # "confirmed" purchase
    # maybe send email
    # clear cart
    @cart.cart_items.destroy_all

  end
  def person_params
    params.require(:person).permit(:first_name, :last_name,:email, :phone_number, :address)
  end
end
