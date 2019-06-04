function result = default (base, fieldnameOrFieldnames, default_value)
  if (iscell(fieldnameOrFieldnames))
    fieldnames = fieldnameOrFieldnames;
  else
    fieldnames = { fieldnameOrFieldnames };
  end

  for cell = fieldnames
    fieldname = cell{1};

    if (isfield(base, fieldname))
      base = base.(fieldname);
    else
      result = default_value;
      return;
    end
  end

  result = base;
end
