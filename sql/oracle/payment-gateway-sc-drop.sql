begin
  acs_sc_contract.delete('PaymentGateway');
  acs_sc_msg_type.delete(null,'PaymentGateway.Authorize.InputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.Authorize.OutputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.ChargeCard.InputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.ChargeCard.OutputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.Return.InputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.Return.OutputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.Void.InputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.Void.OutputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.Info.InputType');
  acs_sc_msg_type.delete(null,'PaymentGateway.Info.OutputType');
end;
/
show errors
