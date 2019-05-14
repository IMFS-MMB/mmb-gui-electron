function result = copy_fields (source, target)
  fields = fieldnames(source);

  for i = 1:numel(fields)
    target.(fields{i}) = source.(fields{i});
  end

  result = target;
end
