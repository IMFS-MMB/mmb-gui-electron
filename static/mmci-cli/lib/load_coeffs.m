function result = load_coeffs (coeffs)
  result = arrayfun(@(coeffcell) coerce_number(coeffcell{1}), coeffs);
end

function result = coerce_number (it)
  if (ischar(it))
    result = eval(it);
  else
    result = it;
  end

  if(~isnumeric(result))
    warning(['Unable to coerce number.']);
    warning(it);
  end
end
