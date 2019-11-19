function result = expect(text, expected, actual)
  disp(['--- ' text ' ---']);

  disp(sprintf('expected %g, actual %g', expected, actual));
  if(actual == expected)
    disp('success');
    result = 1;
  else
    disp('failed');
    result = 0;
  end
end
