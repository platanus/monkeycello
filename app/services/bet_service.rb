require 'faker'

class BetService < PowerTypes::Service.new
  def reset_and_run
    @current_date = Date.new(2020, 3, 3)
    ActiveRecord::Base.logger.level = 1

    destroy_all
    create_casino # 1 casino
    create_users_with_bananas # 5 monkeys, 100 bananas each

    play # run 10 random bets
  end

  private

  def destroy_all
    Casino.destroy_all
    Deposit.destroy_all
    Withdrawal.destroy_all
    User.destroy_all
    Bet.destroy_all
  end

  def create_casino
    Casino.create
    feedback("Welcome to Monckycello")
  end

  def create_users_with_bananas
    5.times.each do
      user = User.create!(
        casino: this_casino,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password
      )

      Deposit.create(user: user, bananas: 100, created_at: @current_date)
      feedback("El usuario #{user.email} depositó 100 bananas")
    end
  end

  def play
    10.times.each do
      puts
      @current_date = @current_date + 1.day

      bet = Bet.create(casino: this_casino, winner: pick_random_user, created_at: @current_date)
      feedback("#{@current_date} nueva apuesta y ganó #{bet.winner.email}")

      3.times.each { deposit_randomly }
      3.times.each { withdraw_randomly }
    end
  end

  def deposit_randomly
    if rand(10) < 5
      user = pick_random_user
      deposit = Deposit.create(user: user, bananas: rand(1..20), created_at: @current_date)

      feedback("---> ludópata #{user.email} depositó #{deposit.bananas} bananas 🍌")
    end
  end

  def withdraw_randomly
    if rand(10) < 5
      user = pick_random_user
      deposit = Withdrawal.create(user: user, bananas: rand(2..20), created_at: @current_date)

      feedback("<--- ludópata #{user.email} retiró #{deposit.bananas} bananas 🍌")
    end
  end

  def pick_random_user
    User.all.sample
  end

  def this_casino
    Casino.last
  end

  def feedback(message)
    p message
    sleep(0.05)
  end
end
