module ApplicationHelper
    
    def url
        request.original_url
    end
    
    def navbar
        if current_store
            # 'layouts/store_navbar'
            'layouts/pharmacy_layout'
        elsif current_admin
            'layouts/admin_navbar'
        else
            if request.original_url.include?('/blog')
                'layouts/blog_navbar'
            else
                'layouts/main_navbar'
            end
        end
    end
    
    def check_active(page)
        if url.include?(page)
            'active'
        end
        # request.original_url == root_url ? 'active' : ''
    end
    
    def select_prescription
        count = Prescription.all.map(&:id)
        Prescription.find_by(id: count[rand(0..count.length-1)])
    end
    
    def checkout_link
        "/#{current_cart.id}/checkout?cart_id=#{@token}&shopper=true&guest=false&senzzu_token=#{guest_shopper.email}" 
    end
    
    def body
        current_store ? 'layouts/store_body' : 'layouts/main_body'
    end
    
    def footer
        current_store ? 'stores/footer' : 'layouts/footer'
    end
    
    def current_cart
        @cart = Cart.where(shopper_email: guest_shopper.email, pending: true).last
        if @cart.nil?
            @cart = Cart.create(shopper_email: guest_shopper.email, pending: true)
        end
        return @cart
    end
    
    def logistics_details_for(store)
        store.delivery_minimum
        # if !store.has_a_bank_account
        #     'Delivery & Pickup (cash/card)'
        # else
        #     'Delivery & Pickup'
        # end
    end
    
    def banner_path
        'https://s3.us-east-2.amazonaws.com/senzzu/banner.jpg' 
    end
    
    def item_categories
        ['skin-care', 'baby-care', 'hair-care', 'dental-care', 'cold-relief', 'pain-relief', 'fever-reducers', 'personal-care', 'toiletries', "women's hygiene",
        "anti-diahrreal", 'allergy-relief', 'anti-bacterial', 'household items', 'vitamins & supplements', 'and more!'] 
    end
    
    def unescape(content)
        URI.unescape(content)
    end
    
    def encode(string)
        URI.encode(string)
    end
    
    def decode(string)
        URI.decode(string)
    end
    
    def featured_article
        ## Placeholder until we figure out how to select a feature article
        Article.last
    end
    
    def month_from(date)
        date + 30.days
    end
    
end
