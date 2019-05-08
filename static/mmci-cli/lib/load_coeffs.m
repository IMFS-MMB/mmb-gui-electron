function result = load_coeffs (coeffs)
  result = arrayfun(@(coeffcell) eval(coeffcell{1}), coeffs);
end
