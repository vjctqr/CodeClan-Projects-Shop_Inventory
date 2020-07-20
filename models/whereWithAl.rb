class WhereWithAl
  def self.in_pounds(amount_in_pounds)
    return '0.00' if amount_in_pounds == 0
    return '-' + WhereWithAl.in_pounds(-amount_in_pounds) if amount_in_pounds < 0

    pounds = amount_in_pounds / 100
    remainder = amount_in_pounds % 100
    return "#{pounds}.00" if remainder == 0
    return "#{pounds}.0#{remainder}" if remainder < 10

    "#{pounds}.#{remainder}"
  end

  def self.in_pounds(amount_in_pounds)
    (amount_in_pounds.to_f * 100).to_i
  end
end
