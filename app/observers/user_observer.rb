class UserObserver < PowerTypes::Observer
    before_destroy :pay_for_retire
  
    def pay_for_retire
        puts 'retirandomeeee'
    end
end