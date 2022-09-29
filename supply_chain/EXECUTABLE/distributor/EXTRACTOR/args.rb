def parameter_extract(me)
    me.arguments << me.parameters[:prod_step_key]
    me.arguments << me.parameters[:prod_produced_key]
    me.arguments << me.parameters[:cust_step_key]
    me.arguments << me.parameters[:cust_taken_key]
end
