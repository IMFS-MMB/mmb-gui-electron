function result = struct_from_names_and_values (names, mapper)
  for i = 1:size(names,1)
    name = deblank(names(i,:));
    value = mapper(i);

    result.(name) = value;
  end
end
