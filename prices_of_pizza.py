# Created by: Kay Lin
# Created on: 13th-Oct-2017
# Created for: ICS3U
# This program calculates the cost of a pizza

import ui


def calculate_button_touch_up_inside(sender):
    #calculate cost
    
    #constants
    LARGE_COST = 6.00
    EXTRA_LARGE_COST = 10.00
    ONE_TOPPING_COST = 1.00
    TWO_TOPPINGS_COST = 1.75
    THREE_TOPPINGS_COST = 2.50
    FOUR_TOPPINGS_COST = 3.25
    HST = 0.13
    
    #input
    PIZZA_OPTION = float(view['pizza_code_textfield'].text)
    the_number_of_toppings = float(view['number_of_toppings_textfield'].text)

    
    #process
    
    #PIZZA_COST
    if PIZZA_OPTION == 1:
       PIZZA_COST = LARGE_COST
    elif  PIZZA_OPTION == 2:
          PIZZA_COST = EXTRA_LARGE_COST
    
    #TOPPINGS_COST
    if TOPPINGS_OPTION == 1:
       TOPPINGS_COST = ONE_TOPPING_COST
    elif TOPPINGS_OPTION == 2:
         TOPPINGS_COST = TWO_TOPPINGS_COST
    elif TOPPINGS_OPTION == 3:
         TOPPINGS_COST = THREE_TOPPINGS_COST
    elif TOPPINGS_OPTION == 4:
         TOPPINGS_COST = FOUR_TOPPINGS_COST
         
    SUB_TOTAL = PIZZA_COST + TOPPINGS_COST
    HST_TOTAL_TAX = SUB_TOTAL * HST
    TOTAL = SUB_TOTAL + HST_TOTAL_TAX
    
    #output
    view['sub_total_label'].text = 'Sub Total: ' + '${:,.2f}'.format(SUB_TOTAL)
    view['hst_label'].text = 'HST Total Tax: ' + '${:,.2f}'.format(HST_TOTAL_TAX)
    view['total_label'].text = 'Total: ' + '${:,.2f}'.format(TOTAL)

view = ui.load_view()
view.present('full_screen')
