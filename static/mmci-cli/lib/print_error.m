function print_error(err)
  try
    out = savejson('', err);
    catch
      try
        out = getReport(err);
      catch
        out = err.message;
      end
  end

  disp(out);
  disp(['current directory: ' pwd]);
end
