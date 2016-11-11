namespace :shopping_cart do
  namespace :fill do
    desc 'Fill countries with default values'
    task countries: :environment do
      file =  File.expand_path('../countries.txt', __FILE__)
      File.open(file).each do |line|
        ShoppingCart::Country.create(title:line)
      end
    end

    desc 'Fill deliveries with default values'
    task deliveries: :environment do
      ShoppingCart::Delivery.create(name:'Ukrposhta', cost:'2')
      ShoppingCart::Delivery.create(name:'Nova Poshta', cost:'10')
      ShoppingCart::Delivery.create(name:'Supermen Post', cost:'15')
    end

    desc 'Create coupon'
    task coupons: :environment do
      ShoppingCart::Coupon.create(name:'sale', discount:'10')
    end
  end
end