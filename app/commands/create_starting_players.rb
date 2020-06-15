class CreateStartingPlayers < PowerTypes::Command.new(:casino)
  def perform
    create_monkeys_with_bananas
  end

  private

  def create_monkeys_with_bananas
    5.times.each do
      monkey = Monkey.create!(
        casino: @casino,
        name: Faker::Superhero.name
      )
      Deposit.create(monkey: monkey, amount: 100)
    end
  end
end
