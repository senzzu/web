class ShoppersController < ApplicationController
    
    def firebase_authentication
        data = params["data"]
        @email = data["email"] if data["email"]
        @password = data["password"] if data["password"]
        @phone = data["phone"] if data["phone"]
        @auth_type = data["authType"]
        render :layout => false
    end
    
    def add_data_to_firestore
        data = params["data"]
        @type = data["type"]
        @store_id = data["storeID"]
        @doc_id = data["docID"]
        @shopper_uid = data["shopperUID"]
        @shopper_phone = data["shopperPhone"]
        @shopper_email = data["shopperEmail"]
        @shopper_address = data["shopperAddress"]
        @apartment_number = data["shopperAptNumber"]
        @shopper_name = data["shopperName"]
        @content = data["content"]
        @author_string = data[:author]
        if !@author_string.nil?
            @author_string = data[:author]
            @author = @author_string.split(' ')[0] + ' ' + @author_string.split(' ')[1][0] + '.'
            @review = StoreReview.create(store_id: @store_id, shopper_id: @shopper_uid, author: @author, content: @content)
            @content = @content.gsub("'", "\\\\'")
        end
        render :layout => false 
    end
    
    def read_data_from_firestore
        data = params["data"]
        @store = Store.find_by(id: params["data"]["storeID"])
        @store_id = @store.id if @store
        @cart = Cart.where(shopper_email: guest_shopper.email).last
        @type = data["type"]
        @shopper_id = data["shopperID"] || ''
        @url = request.original_url
        @alerts = HealthAlert.where(customer_id: @shopper_id, read: false).reverse
        @prescriptions = Prescription.where(customer_id: @shopper_id).reverse
        @payments = BillingHistory.where(customer_id: @shopper_id).reverse
        @pharmacies = Store.all
        render :layout => false 
    end
    
    def order_history
        @orders = Order.where(shopper_id: params[:shopper_id])
    end
    
    def create_special_order
        @order = SpecialOrder.new(special_orders_params)
        respond_to do |format|
            if @order.save
                format.js { render :layout => false }
            else
                format.js { render 'item_request_error', :layout => false }
            end
        end
    end
    
    def alert_read
        @alert = HealthAlert.find_by(id: params[:id])
        @alert.update(read: true)
        @alerts = HealthAlert.where(customer_id: params[:shopper_id], read: false).reverse
        render :layout => false
    end
    
    def prescriptions
        @pharmacies = Store.all
    end
    
    def dashboard
        @alerts = HealthAlert.where(customer_id: @shopper_id, read: false).reverse
        @prescriptions = Prescription.where(customer_id: @shopper_id).reverse
        @payments = BillingHistory.where(customer_id: @shopper_id).reverse
        @pharmacies = Store.all
    end
    
    def account_settings
        @coverage = Coverage.find_by(shopper_id: params[:shopper_id])
    end
    
    def process_insurance_image
        @coverage = Coverage.find_by(shopper_id: params[:shopper_id])
        if @coverage.nil?
            @coverage = Coverage.create(
                shopper_id: params[:shopper_id],
                carrier: "Healthfirst",
                member_id: "FH92HF83",
                provider_name: "Ronald Doe",
                provider_phone: "555-555-5555",
                rx_bin: "092HDL7",
                rx_group: "Rx0000",
                generic_copay: 0.0,
                brand_copay: 0.0,
                otc_copay: 0.0
            )
        else
            @coverage.update(
                shopper_id: params[:shopper_id],
                carrier: "Medicare",
                member_id: "FH92HF83",
                provider_name: "Jane M. Doe",
                provider_phone: "666-666-6666",
                rx_bin: "092HDL7",
                rx_group: "Rx1111",
                generic_copay: 0.0,
                brand_copay: 0.0,
                otc_copay: 0.0
            )
        end
        render :layout => false
    end
    
    private
    
    def special_orders_params
        params.require(:special_order).permit(:item_name, :item_size, :item_description, :item_price, :availability_date, :store_id, :shopper_phone) 
    end
    
end