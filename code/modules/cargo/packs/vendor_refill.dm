/datum/supply_pack/vendor_refill
	group = "Vendor Refills"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vendor_refill/bartending
	name = "Booze-o-mat and Coffee Supply Crate"
	desc = "Bring on the booze and coffee vending machine refills."
	cost = 2000
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee)
	crate_name = "bartending supply crate"

/datum/supply_pack/vendor_refill/cola
	name = "Softdrinks Supply Crate"
	desc = "Got whacked by a toolbox, but you still have those pesky teeth? Get rid of those pearly whites with this soda machine refill, today!"
	cost = 1500
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "soft drinks supply crate"

/datum/supply_pack/vendor_refill/snack
	name = "Snack Supply Crate"
	desc = "One vending machine refill of cavity-bringin' goodness! The number one dentist recommended order!"
	cost = 1500
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "snacks supply crate"

/datum/supply_pack/vendor_refill/autodrobe
	name = "Autodrobe Supply Crate"
	desc = "Autodrobe missing your favorite dress? Solve that issue today with this autodrobe refill."
	cost = 1000
	contains = list(/obj/item/vending_refill/autodrobe)
	crate_name = "autodrobe supply crate"

/datum/supply_pack/vendor_refill/cigarette
	name = "Cigarette Supply Crate"
	desc = "Don't believe the reports - smoke today! Contains a cigarette vending machine refill."
	cost = 1500
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "cigarette supply crate"

/datum/supply_pack/vendor_refill/games
	name = "Games Supply Crate"
	desc = "Get your game on with this game vending machine refill."
	cost = 1000
	contains = list(/obj/item/vending_refill/games)
	crate_name = "games supply crate"

///Pulsar 20/08/2024
/datum/supply_pack/vendor_refill/mining
	name = "Mining Equipement Supply Crate"
	desc = "Improve your mining operations with this mining equipement vending machine refill."
	cost = 2500
	contains = list(/obj/item/vending_refill/mining_equipment)
	crate_name = "mining equipement crate"

/datum/supply_pack/vendor_refill/medical
	name = "Medical Supply Crate"
	desc = "Keep yourself (and your crew) alive with this medical vending machine refill"
	cost = 2500
	contains = list(/obj/item/vending_refill/medical)
	crate_name = "medical equipement crate"

/datum/supply_pack/vendor_refill/engineering
	name = "Engineering Supply Crates"
	desc = "Start working on your machines properly with these engineering vending machine refill"
	cost = 3000
	contains = list(/obj/item/vending_refill/engineering,
					/obj/item/vending_refill/engivend)
	crate_name = "engineering equipement crate"

/datum/supply_pack/vendor_refill/hydroponics
	name = "Hydroponics Supply Crates"
	desc = "Got a green thumb ? This set of hydroponics vending machine refill will help you set up a neat little garden"
	cost = 3000
	contains = list(/obj/item/vending_refill/hydronutrients,
					/obj/item/vending_refill/hydroseeds)
	crate_name = "hydroponics equipement crate"
