# Set up return code values;  these are global to all payment gateways
# using this service contract.
ad_after_server_initialization payment-gateway {
  nsv_set payment_gateway_return_codes success "success"
  nsv_set payment_gateway_return_codes failure "failure"
  nsv_set payment_gateway_return_codes retry "failure-retry"
  nsv_set payment_gateway_return_codes not_supported "not_supported"
  nsv_set payment_gateway_return_codes not_implemented "not_implemented"
}
