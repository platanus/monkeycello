require 'faker'

class BetService < PowerTypes::Service.new
  def reset_and_run
    @current_date = Date.new(2020, 3, 3)
    ActiveRecord::Base.logger.level = 1

    destroy_all
    create_casino # 1 casino
    create_monkeys_with_bananas # 5 monkeys, 100 bananas each

    play # run 10 random bets
    reset_ledgerizer_accounts
  end

  private

  def destroy_all
    reset_ledgerizer_accounts
    Deposit.destroy_all
    Withdrawal.destroy_all
    Bet.destroy_all
    Monkey.destroy_all
    Casino.destroy_all
  end

  def reset_ledgerizer_accounts
    Ledgerizer::Account.destroy_all
    Ledgerizer::Entry.destroy_all
    Ledgerizer::Line.destroy_all
  end

  def create_casino
    Casino.create
    feedback("Welcome to Monckycello")
  end

  def create_monkeys_with_bananas
    5.times.each do
      monkey = Monkey.create!(
        casino: this_casino,
        name: Faker::Superhero.name
      )

      Deposit.create(monkey: monkey, amount: 100, created_at: @current_date)
      feedback("El mono #{monkey.name} depositó 100 bananas")
    end
  end

  def play
    10.times.each do
      puts
      @current_date = @current_date + 1.day

      bet = Bet.create(casino: this_casino, winner: pick_random_monkey, created_at: @current_date)
      feedback("#{@current_date} nueva apuesta y ganó #{bet.winner.name}")

      3.times.each { deposit_randomly }
      3.times.each { withdraw_randomly }
    end
  end

  def deposit_randomly
    if rand(10) < 5
      monkey = pick_random_monkey
      deposit = Deposit.create(monkey: monkey, amount: rand(1..20), created_at: @current_date)

      feedback("---> mono #{monkey.name} depositó #{deposit.amount} bananas 🍌")
    end
  end

  def withdraw_randomly
    if rand(10) < 5
      monkey = pick_random_monkey
      deposit = Withdrawal.create(monkey: monkey, amount: rand(2..20), created_at: @current_date)

      feedback("<--- mono #{monkey.name} retiró #{deposit.amount} bananas 🍌")
    end
  end

  def pick_random_monkey
    Monkey.all.sample
  end

  def this_casino
    Casino.last
  end

  def feedback(message)
    p message
    sleep(0.05)
  end
end
