begin
  acs_sc_contract.del('PaymentGateway');
  acs_sc_msg_type.del(null,'PaymentGateway.Authorize.InputType');
  acs_sc_msg_type.del(null,'PaymentGateway.Authorize.OutputType');
  acs_sc_msg_type.del(null,'PaymentGateway.ChargeCard.InputType');
  acs_sc_msg_type.del(null,'PaymentGateway.ChargeCard.OutputType');
  acs_sc_msg_type.del(null,'PaymentGateway.Return.InputType');
  acs_sc_msg_type.del(null,'PaymentGateway.Return.OutputType');
  acs_sc_msg_type.del(null,'PaymentGateway.Void.InputType');
  acs_sc_msg_type.del(null,'PaymentGateway.Void.OutputType');
  acs_sc_msg_type.del(null,'PaymentGateway.Info.InputType');
  acs_sc_msg_type.del(null,'PaymentGateway.Info.OutputType');
end;
/
show errors
