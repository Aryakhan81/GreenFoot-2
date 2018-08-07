//
//  SurveyInfo.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/29/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import Foundation

struct SurveyInfo {
    var input_location: Int? //User inputs their zipcode
    var input_income: Int? //User inputs their income (dollar amount gets converted to an Int between 1-11)
    let input_location_mode = 1 //Zipcode
    var input_size: Int? //The number of people that live in the user's house
    var input_footprint_transportation_miles1: Int? //Miles travelled by a car that the user owns
    var input_footprint_transportation_mpg1: Int? //MPG of that car
    let input_footprint_transportation_fuel1 = 1 //All cars are assumed to be gas
    var input_footprint_transportation_miles2: Int? //Miles travelled by another car that the user owns
    var input_footprint_transportation_mpg2: Int? //MPG of that car
    let input_footprint_transportation_fuel2 = 1 //All cars are assumed to be gas
    var input_footprint_transportation_miles3: Int? //Miles travelled by another car that the user owns
    var input_footprint_transportation_mpg3: Int? //MPG of that car
    let input_footprint_transportation_fuel3 = 1 //All cars are assumed to be gas
    var input_footprint_transportation_miles4: Int? //Miles travelled by another car that the user owns
    var input_footprint_transportation_mpg4: Int? //MPG of that car
    let input_footprint_transportation_fuel4 = 1
    let input_footprint_transportation_miles5 = 0 //All other car variables are discarded
    let input_footprint_transportation_mpg5 = 0
    let input_footprint_transportation_fuel5 = 1
    let input_footprint_transportation_miles6 = 0
    let input_footprint_transportation_mpg6 = 0
    let input_footprint_transportation_fuel6 = 1
    let input_footprint_transportation_miles7 = 0
    let input_footprint_transportation_mpg7 = 0
    let input_footprint_transportation_fuel7 = 1
    let input_footprint_transportation_miles8 = 0
    let input_footprint_transportation_mpg8 = 0
    let input_footprint_transportation_fuel8 = 1
    let input_footprint_transportation_miles9 = 0
    let input_footprint_transportation_mpg9 = 0
    let input_footprint_transportation_fuel9 = 1
    let input_footprint_transportation_miles10 = 0
    let input_footprint_transportation_mpg10 = 0
    let input_footprint_transportation_fuel10 = 1 //End useless car variables
    let input_footprint_transportation_num_vehicles = 4 //Number of vehicles is assumed to be 4, if 0mpg is inputed then that car gets deleted
    let input_footprint_transportation_airtype = "simple" //Just total miles covered for air
    var input_footprint_transportation_airtotal: Int? //Total miles covered for air
    let input_footprint_transportation_groundtype = "simple" //Just total miles ridden for public transportation
    var input_footprint_transportation_publictrans: Int? //Total miles covered for public transport
    var internal_state_abbreviation: String? //State abbreviation
    let input_footprint_housing_electricity_type = 0 //In $/year
    var input_footprint_housing_electricity_dollars: Int? //Electricity cost/year
    let input_footprint_housing_cleanpercent = 0 //Assume no clean energy
    let input_footprint_housing_naturalgas_type = 0 //In $/year
    var input_footprint_housing_naturalgas_dollars: Int? //Natural gas cost/year
    let input_footprint_housing_heatingoil_type = 0 //In $/year
    var input_footprint_housing_heatingoil_dollars: Int? //Heating oil cost/year
    let input_footprint_housing_heatingoil_dollars_per_gallon = 4 //On average, heating oil is $4/gallon
    var input_footprint_housing_watersewage: Int? //Water/sewage cost/year
    var input_footprint_housing_squarefeet: Int? //How large the user's house is
    var input_footprint_household_adults: Int? //How many adults occupy the user's house
    var input_footprint_household_children: Int? //How many children occupy the user's house
    let input_changed = 0 //Meaningless variable
    let input_footprint_shopping_food_meattype = "simple" //Simple description of meat consumed by the user
    var input_footprint_shopping_food_meatfisheggs: Int? //Calories eaten daily of meat, fish and eggs
    var input_footprint_shopping_food_dairy: Int? //Calories eaten daily of dairy
    var input_footprint_shopping_food_otherfood: Int? //Calories per day other food
    var input_footprint_shopping_food_fruitvegetables: Int? //Calories per day fruits and veggies
    var input_footprint_shopping_food_cereals: Int? //Calories per day cereals
    var input_footprint_shopping_goods_default_furnitureappliances: Int? //Funiture and appliances cost/year
    var input_footprint_shopping_goods_default_clothing: Int? //Clothing cost/year
    var input_footprint_shopping_goods_default_other_entertainment: Int? //Entertainment cost/year
    var input_footprint_shopping_goods_default_other_office: Int? //Office supplies cost/year
    var input_footprint_shopping_goods_default_other_personalcare: Int? //Personal care cost/year
    var input_footprint_shopping_goods_default_other_autoparts: Int? //Auto cost/year
    var input_footprint_shopping_goods_default_other_medical: Int?
    let input_footprint_shopping_goods_type = "advanced"
    var input_footprint_shopping_goods_total: Int? //Not inputed by the user, sum of the subtotals
    let input_footprint_shopping_services_type = "simple"
    var input_footprint_shopping_services_total: Int? //How much the user spends on services per year
    let input_footprint_housing_gco2_per_kwh = 1000 //Grams of CO2 released per KWh of electricity, 1000 is average
    var input_footprint_housing_hdd: Int? //Days that the house is heated/year
    var input_footprint_housing_cdd: Int? //Days that the house is cooled/year
    
    init() {
        self.input_location = nil //Done
        self.input_income = nil //Done
        self.input_size = nil //Done
        self.input_footprint_transportation_miles1 = nil //Done
        self.input_footprint_transportation_mpg1 = nil //Done
        self.input_footprint_transportation_miles2 = nil //Done
        self.input_footprint_transportation_mpg2 = nil //Done
        self.input_footprint_transportation_miles3 = nil //Done
        self.input_footprint_transportation_mpg3 = nil //Done
        self.input_footprint_transportation_miles4 = nil //Done
        self.input_footprint_transportation_mpg4 = nil //Done
        self.input_footprint_transportation_airtotal = nil //Done
        self.input_footprint_transportation_publictrans = nil //Done
        self.internal_state_abbreviation = nil
        self.input_footprint_housing_electricity_dollars = nil //Done
        self.input_footprint_housing_naturalgas_dollars = nil //Done
        self.input_footprint_housing_heatingoil_dollars = nil //Done
        self.input_footprint_housing_watersewage = nil //Done
        self.input_footprint_housing_squarefeet = nil //Done
        self.input_footprint_household_adults = nil //Done
        self.input_footprint_household_children = nil //Done
        self.input_footprint_shopping_food_meatfisheggs = nil //Done
        self.input_footprint_shopping_food_dairy = nil //Done
        self.input_footprint_shopping_food_otherfood = nil //Done
        self.input_footprint_shopping_food_fruitvegetables = nil //Done
        self.input_footprint_shopping_food_cereals = nil //Done
        self.input_footprint_shopping_goods_default_furnitureappliances = nil //Done
        self.input_footprint_shopping_goods_default_clothing = nil //Done
        self.input_footprint_shopping_goods_default_other_entertainment = nil //Done
        self.input_footprint_shopping_goods_default_other_office = nil //Done
        self.input_footprint_shopping_goods_default_other_personalcare = nil //Done
        self.input_footprint_shopping_goods_default_other_autoparts = nil //Done
        self.input_footprint_shopping_goods_default_other_medical = nil //Done
        self.input_footprint_shopping_goods_total = nil //Done within code of FifthSurveyViewController as sum of the above
        self.input_footprint_shopping_services_total = nil //Done
        self.input_footprint_housing_hdd = nil //Done
        self.input_footprint_housing_cdd = nil //Done
    }
}
