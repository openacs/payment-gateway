ad_page_contract {
  This is part of the credit card gateway, for obvious reasons, but it
  takes it's list of of what cards it can accept from the caller's
  package params.  

  That means that it's intended to be used only by the caller, and that 
  the caller must define a package param called CreditCardsAccepted.
  That param is *not* part of this package and it's not supposed to be.
  Don't try to add one! :)

  @author Janine Sisk, furfly.net LLC (janine@furfly.net)
  @cvs-id $Id$
} {
} -properties {
 cards_we_accept:onevalue
 card_list:multirow
}

set cards_we_accept [ad_parameter -package_id [ad_conn package_id] CreditCardsAccepted ""]
regsub -all {( )*,( )*} $cards_we_accept "," cards_we_accept

template::multirow create card_list card_type
foreach card_type [split $cards_we_accept ,] {
  template::multirow append card_list $card_type
}
