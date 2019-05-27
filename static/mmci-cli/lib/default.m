function result = default (base, fieldname, default_value)
  if (isfield(base, fieldname))
    result = base.(fieldname);
  else
    result = default_value;
  end
end
