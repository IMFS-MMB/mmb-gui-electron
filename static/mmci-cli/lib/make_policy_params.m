function make_policy_params (path, coeffs)
  cofintintb1  = coeffs(1);
  cofintintb2  = coeffs(2);
  cofintintb3  = coeffs(3);
  cofintintb4  = coeffs(4);
  cofintinf0   = coeffs(5);
  cofintinfb1  = coeffs(6);
  cofintinfb2  = coeffs(7);
  cofintinfb3  = coeffs(8);
  cofintinfb4  = coeffs(9);
  cofintinff1  = coeffs(10);
  cofintinff2  = coeffs(11);
  cofintinff3  = coeffs(12);
  cofintinff4  = coeffs(13);
  cofintout    = coeffs(14);
  cofintoutb1  = coeffs(15);
  cofintoutb2  = coeffs(16);
  cofintoutb3  = coeffs(17);
  cofintoutb4  = coeffs(18);
  cofintoutf1  = coeffs(19);
  cofintoutf2  = coeffs(20);
  cofintoutf3  = coeffs(21);
  cofintoutf4  = coeffs(22);
  cofintoutp   = coeffs(23);
  cofintoutpb1 = coeffs(24);
  cofintoutpb2 = coeffs(25);
  cofintoutpb3 = coeffs(26);
  cofintoutpb4 = coeffs(27);
  cofintoutpf1 = coeffs(28);
  cofintoutpf2 = coeffs(29);
  cofintoutpf3 = coeffs(30);
  cofintoutpf4 = coeffs(31);
  std_r_       = coeffs(32);
  std_r_quart  = coeffs(33);

  save(path,'cofintintb1','cofintintb2','cofintintb3','cofintintb4',...
            'cofintinf0','cofintinfb1','cofintinfb2','cofintinfb3','cofintinfb4','cofintinff1','cofintinff2','cofintinff3','cofintinff4',...
            'cofintout','cofintoutb1','cofintoutb2','cofintoutb3','cofintoutb4','cofintoutf1','cofintoutf2','cofintoutf3','cofintoutf4',...
            'cofintoutp','cofintoutpb1','cofintoutpb2','cofintoutpb3','cofintoutpb4','cofintoutpf1','cofintoutpf2','cofintoutpf3','cofintoutpf4',...
            'std_r_','std_r_quart');
end
