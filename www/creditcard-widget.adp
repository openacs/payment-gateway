<p>We accept @cards_we_accept@</p>

<p>
<table>
  <tr>
    <td>Card Number</td>
    <td><input type=text size=22 name=card_number></td>
  </tr>
  <tr>
    <td>Expiration Date (MM/YY)</td>
    <td><input type=text size=2 maxlength=2 name=card_exp_month> / <input type=text size=4 maxlength=4 name=card_exp_year></td>
  </tr>
<if @card_list:rowcount@ ne 0>
  <tr>
    <td>Card Type</td>
    <td><select name=card_type>
      <multiple name=card_list>
        <option value="@card_list.card_type@">@card_list.card_type@
      </multiple>
      </select></td>
  </tr>
</if>
  <tr>
    <td>Name on credit card</td>
    <td><input type=text size=30 name=name_on_card></td>
  </tr>
  <tr>
    <td>Billing Address Line 1</td>
    <td><input type=text size=60 name=billing_line1></td>
  </tr>
  <tr>
    <td>Billing Address Line 2</td>
    <td><input type=text size=60 name=billing_line2></td>
  </tr>
  <tr>
    <td>Billing City</td>
    <td><input type=text size=15 name=billing_city>
        Billing State <input type=text size=15 name=billing_state>
        Billing Zip Code <input type=text size=10 name=billing_zip_code>
        <br>(if you live outside the U.S., leave the zip blank)</td>
  </tr>
</table>

