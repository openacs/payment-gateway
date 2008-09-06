select acs_sc_contract__new (
           'PaymentGateway',			       -- contract_name
	   'Interface to Credit Card Payment Gateway'  -- contract_desc
);

-- Authorize gets an authorization to charge.  For gateways that support it,
-- this is done when the order is placed, to verify that the card is good.
select acs_sc_msg_type__new (
           'PaymentGateway.Authorize.InputType',
	   'transaction_id:integer,amount:string,card_type:string,card_number:string,card_exp_month:string,card_exp_year:string,card_code:string,card_name:string,billing_street:string,billing_city:string,billing_state:string,billing_zip:string,billing_country:string'
);

select acs_sc_msg_type__new (
           'PaymentGateway.Authorize.OutputType',
	   'response_code:string,reason:string,transaction_id:string'
);

select acs_sc_operation__new (
           'PaymentGateway',			  -- contract_name
           'Authorize',				  -- operation_name
	   'Authorize',                		  -- operation_desc
	   'f',					  -- operation_iscachable_p
	    12,					  -- operation_nargs
	   'PaymentGateway.Authorize.InputType',  -- operation_inputtype
	   'PaymentGateway.Authorize.OutputType'  -- operation_outputtype
);


-- ChargeCard is a wrapper which may call postauth, authcapture or charge, 
-- depending on the needs of the particular gateway.  This is sort of gross;
-- the wrapper is needed so that the caller doesn't have to know which gateway
-- it's talking to, but it has a nasty side-effect:  a transaction_id will be
-- a required argument, even though it may be replaced by the one assigned by
-- the gateway.  I guess there are worse things...  The PostAuth, AuthCapture
-- and Charge functions won't be defined in the service contract since they
-- should not be called directly by the end user.
select acs_sc_msg_type__new (
           'PaymentGateway.ChargeCard.InputType',
	   'transaction_id:integer,amount:string,card_type:string,card_number:string,card_exp_month:string,card_exp_year:string,card_code:string,card_name:string,billing_street:string,billing_city:string,billing_state:string,billing_zip:string,billing_country:string'
);

select acs_sc_msg_type__new (
           'PaymentGateway.ChargeCard.OutputType',
	   'response_code:string,reason:string,transaction_id:string'
);

select acs_sc_operation__new (
           'PaymentGateway',			  -- contract_name
           'ChargeCard',			  -- operation_name
	   'ChargeCard',               		  -- operation_desc
	   'f',					  -- operation_iscachable_p
	    12,					  -- operation_nargs
	   'PaymentGateway.ChargeCard.InputType', -- operation_inputtype
	   'PaymentGateway.ChargeCard.OutputType' -- operation_outputtype
);


-- Most of the time you probably don't need to pass in all this info to do
-- a return or void, but since we can't be sure there isn't a service out
-- there that requires it, I've included it here.  No harm done if it's not 
-- needed
select acs_sc_msg_type__new (
           'PaymentGateway.Return.InputType',
	   'transaction_id:integer,amount:string,card_type:string,card_number:string,card_exp_month:string,card_exp_year:string,card_code:string,card_name:string,billing_street:string,billing_city:string,billing_state:string,billing_zip:string,billing_country:string'
);
select acs_sc_msg_type__new (
           'PaymentGateway.Return.OutputType',
	   'response_code:string,reason:string,transaction_id:string'
);

select acs_sc_operation__new (
           'PaymentGateway',		      -- contract_name
           'Return',			      -- operation_name
	   'Return',               	      -- operation_desc
	   'f',				      -- operation_iscachable_p
	    12,				      -- operation_nargs
	   'PaymentGateway.Return.InputType', -- operation_inputtype
	   'PaymentGateway.Return.OutputType' -- operation_outputtype
);


-- Void is probably the least commonly supported, but it does exist.
select acs_sc_msg_type__new (
           'PaymentGateway.Void.InputType',
	   'transaction_id:integer,amount:string,card_type:string,card_number:string,card_exp_month:string,card_exp_year:string,card_code:string,card_name:string,billing_street:string,billing_city:string,billing_state:string,billing_zip:string,billing_country:string'
);

select acs_sc_msg_type__new (
           'PaymentGateway.Void.OutputType',
	   'response_code:string,reason:string,transaction_id:string'
);

select acs_sc_operation__new (
           'PaymentGateway',		      -- contract_name
           'Void',			      -- operation_name
	   'Void',               	      -- operation_desc
	   'f',				      -- operation_iscachable_p
	    12,				      -- operation_nargs
	   'PaymentGateway.Void.InputType', -- operation_inputtype
	   'PaymentGateway.Void.OutputType' -- operation_outputtype
);


-- return information about us to the caller
select acs_sc_msg_type__new (
           'PaymentGateway.Info.InputType',
	   ''
);

select acs_sc_msg_type__new (
           'PaymentGateway.Info.OutputType',
	   'package_key:string,version:version,package_name:string,cards_accepted:string,success:string,failure:string,retry:string,not_supported:string,not_implemented:string'
);

select acs_sc_operation__new (
           'PaymentGateway',				-- contract_name
           'Info',					-- operation_name
	   'Information about the gateway',		-- operation_desc
	   'f',						-- operation_iscachable_p
	    1,						-- operation_nargs
	   'PaymentGateway.Info.InputType',		-- operation_inputtype
	   'PaymentGateway.Info.OutputType'		-- operation_outputtype
);

