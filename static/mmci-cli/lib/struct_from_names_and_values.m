function result = struct_from_names_and_values (names, mapper)
d_version = dynare_version;
  for i = 1:size(names,1)
      if str2num(d_version([1 3])) <46;  % changed for dynare 4.6
        name = deblank(names(i,:));
      else
        name = names{i};
      end
    value = mapper(i);

    result.(name) = value;
  end
end
