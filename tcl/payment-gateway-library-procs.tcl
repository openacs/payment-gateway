# Distributed under the GNU GPL v2

ad_library {

    Tcl library for dotlrn-event-registrations

    @author Janine Sisk (janine@furfly.net)
    @creation-date 05-07-02

}

namespace eval payment_gateway {

    ad_proc -public clean_card_number {
        card_number
    } {
        Remove any non-numeric characters from card number
    } {
        regsub -all {([^0-9]*)([0-9]*)} $card_number {\2} card_number
        return $card_number
    }

    ad_proc -public check_card_type {
        user_card_type
    } {
        Check the card type entered by the user against a list of card types
        this website supports.  The card type parameter is supplied by the 
        calling application, ie something like E-Commerce or Shoppe.  Don't
        add one to payment-gateway or your payment module;  only the caller
        can adequately specify which cards their particular merchant account
        supports

        Return values are:  0 => failure, 1 => success, -1 => card type 
        parameter not set or set improperly
    } {
        # get list of cards accepted;  if it's not set or is empty, return error
        set cards_accepted [ad_parameter -package_id [ad_conn package_id] CreditCardsAccepted ""]
        if { [string length $cards_accepted] == 0 } {
          return -1
        }

        # we can't fix all formatting errors the site admin might make but
        # we can regsub out a few of the most likely.  This removes any spaces
        # before or after the commas
        regsub -all {( )*,( )*} $cards_accepted "," cards_accepted

        # now go through the list, looking for the card type that was
        # passed in.  Use -nocase since we don't want to get tripped up
        # on differences in capitalization.  It is, however, the caller's
        # responsibility to make sure that the list they specify in the
        # parameter and the list they allow the user to choose from uses
        # the same syntax!
        foreach type [split $cards_accepted ,] {
          if { [string compare -nocase $user_card_type $type] == 0 } {
            return 1
          }
        }

        # since we got here, we know there was no match
        return 0
    }
}
