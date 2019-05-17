function rule = make_rule (name, coeffs)
  rule.name = name;
  rule.coefficients = load_coeffs(coeffs);
end
