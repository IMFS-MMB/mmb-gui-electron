function result = load_rules (rules, rulespath)
  result = arrayfun(@(x) load_rule(x{1}, rulespath), rules);
end

function result = load_rule (rule, rulespath)
  rulepath = fullfile(rulespath, rule, [rule '.json']);

  result = loadjson(rulepath);
end
