module ApplicationHelper
  def format_money(amount)
    number_to_currency(amount, precision: 0, unit: 'VND', format: "%n %u")
  end
end
