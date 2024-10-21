/obj/machinery/vending/security
	name = "\improper SecTech"
	desc = "A security equipment vendor."
	product_ads = "Crack capitalist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	light_mask = "sec-light-mask"
	req_access = list(ACCESS_SECURITY)
	products = list(
		/obj/item/restraints/handcuffs = 8,
		/obj/item/restraints/handcuffs/cable/zipties = 10,
		/obj/item/assembly/flash/handheld = 5,
		/obj/item/storage/box/evidence = 6,
		/obj/item/flashlight/seclite = 4,
		/obj/item/ammo_box/c9mm/rubbershot = 3,
		/obj/item/ammo_box/c9mm = 1,
		/obj/item/stock_parts/cell/gun = 3,
		/obj/item/clothing/glasses/sunglasses = 2)
	premium = list(
		/obj/item/storage/belt/security/webbing = 5,
		/obj/item/coin/antagtoken = 1,
		/obj/item/clothing/head/helmet/blueshirt = 1,
		/obj/item/clothing/suit/armor/vest/blueshirt = 1,
		/obj/item/clothing/gloves/tackler = 5,
		/obj/item/grenade/stingbang = 1)
	refill_canister = /obj/item/vending_refill/security
	default_price = 650
	extra_price = 700

	var/voucher_items = list(
		"NT-E-Rifle" = /obj/item/gun/energy/e_gun,
		"E-TAR SMG" = /obj/item/gun/energy/e_gun/smg,
		"E-SG 500" = /obj/item/gun/energy/e_gun/iot)

/obj/machinery/vending/security/pre_throw(obj/item/I)
	if(istype(I, /obj/item/grenade))
		var/obj/item/grenade/G = I
		G.preprime()
	else if(istype(I, /obj/item/flashlight))
		var/obj/item/flashlight/F = I
		F.on = TRUE
		F.update_brightness()

/obj/item/vending_refill/security
	icon_state = "refill_sec"

/obj/machinery/vending/security/attackby(obj/item/I, mob/user, params) //WS edit: THERE IS NO GOD. THERE IS ONLY GUNS. REPENT. //shiptest: i should remove this comment, but its funny
	if(istype(I, /obj/item/gun_voucher))
		RedeemVoucher(I, user)
		return
	return..()

/obj/machinery/vending/security/proc/RedeemVoucher(obj/item/gun_voucher/voucher, mob/redeemer)
	var/selection = show_radial_menu(redeemer, src, voucher_items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	if(voucher_items[selection])
		var/drop_location = drop_location()
		var/obj/selected_item = voucher_items[selection]
		new selected_item(drop_location)

	SSblackbox.record_feedback("tally", "gun_voucher_redeemed", 1, selection)
	qdel(voucher)

/obj/machinery/vending/security/wall
	name = "\improper SecTech Lite"
	desc = "A wall mounted security equipment vendor."
	icon_state = "wallsec"
	icon_deny = "wallsec-deny"
	light_mask = "wallsec-light-mask"
	refill_canister = /obj/item/vending_refill/wallsec
	density = FALSE
	tiltable = FALSE
	products = list(
		/obj/item/restraints/handcuffs = 5,
		/obj/item/restraints/handcuffs/cable/zipties = 10,
		/obj/item/stock_parts/cell/gun = 3,
		)
	contraband = list()
	premium = list()

/obj/item/vending_refill/wallsec
	icon_state = "refill_sec"

/obj/machinery/vending/security/marine
	name = "\improper marine vendor"
	desc = "A marine equipment vendor."
	product_ads = "Please insert your marine voucher in the bottom slot."
	icon_state = "marine"
	icon_deny = "marine-deny"
	light_mask = "marine-mask"
	req_access = list(ACCESS_SYNDICATE)
	products = list(
//	24.08.26 - CFW - Add both NT and Syndie options to the independent marine vendor		
//		/obj/item/screwdriver = 5,
//		/obj/item/restraints/handcuffs = 10,
//		/obj/item/assembly/flash/handheld = 10,
//		/obj/item/flashlight/seclite = 10,

//		/obj/item/storage/box/lethalshot = 6,
//		/obj/item/stock_parts/cell/gun = 5,

// Cells
		/obj/item/stock_parts/cell/gun/upgraded = 50,

// Magazines
		/obj/item/ammo_box/magazine/uzim9mm = 50,
		/obj/item/ammo_box/magazine/m10mm = 50,
		/obj/item/ammo_box/magazine/m45 = 50,
		/obj/item/ammo_box/magazine/smgm45 = 50,
		/obj/item/ammo_box/magazine/sniper_rounds = 50,
		/obj/item/ammo_box/magazine/m556 = 50,
		/obj/item/ammo_box/magazine/m12g = 50,
		/obj/item/ammo_box/magazine/ebr = 50,
		/obj/item/ammo_box/magazine/skm_545_39 = 50,
		/obj/item/ammo_box/magazine/skm_762_40 = 50,

// Ammo Boxes
		/obj/item/storage/toolbox/ammo = 50,
		/obj/item/ammo_box/c9mm = 800,
		/obj/item/ammo_box/c9mm/ap = 800,
		/obj/item/ammo_box/c9mm/hp = 800,
		/obj/item/ammo_box/c9mm/fire = 800,
		/obj/item/ammo_box/c10mm = 800,
		/obj/item/ammo_box/c10mm/ap = 800,
		/obj/item/ammo_box/c10mm/hp = 800,
		/obj/item/ammo_box/c10mm/fire = 800,
		/obj/item/ammo_box/c45 = 800,
		/obj/item/ammo_box/c45/ap = 800,
		/obj/item/ammo_box/c45/hp = 800,
		/obj/item/ammo_box/c45/fire = 800,
		/obj/item/ammo_box/c38_box = 800,
		/obj/item/ammo_box/c556mmHITP = 800,
		/obj/item/ammo_box/c556mmHITP/ap = 800,
		/obj/item/ammo_box/c556mmHITP/hp = 800,
		/obj/item/ammo_box/a762_40 = 800,
		/obj/item/ammo_box/a308 = 800,
		/obj/item/ammo_box/a12g = 800,
		/obj/item/ammo_box/a12g/slug = 800,
		/obj/item/ammo_box/c46x30mm_box = 800,
		/obj/item/ammo_box/c8x50mm_box = 800,
		/obj/item/ammo_box/c8x50mmhp_box = 800,
		/obj/item/ammo_box/a300_box = 800,

// Explosives
		/obj/item/ammo_box/a40mm = 800,
		/obj/item/grenade/frag = 50,
		/obj/item/grenade/syndieminibomb/concussion = 50,
		/obj/item/grenade/empgrenade = 50,
		/obj/item/grenade/c4 = 50,
		/obj/item/grenade/c4/x4 = 50,
		/obj/item/gun/ballistic/rocketlauncher/solgov = 50,

// Gear
		/obj/item/clothing/under/rank/security/officer/military = 50,
		/obj/item/clothing/under/rank/security/officer/military/eng = 50,
		/obj/item/clothing/shoes/combat/coldres = 50,
		/obj/item/clothing/gloves/combat = 50,
		/obj/item/clothing/head/helmet/marine = 50,
		/obj/item/clothing/suit/armor/vest/marine = 50,
		/obj/item/clothing/suit/armor/vest/marine/medium = 50,
		/obj/item/clothing/suit/armor/vest/marine/heavy = 50,
		/obj/item/clothing/accessory/holster/marine = 50,
		/obj/item/storage/belt/military = 50,
		/obj/item/clothing/mask/gas/sechailer/swat/spacepol = 50,
		)
	contraband = list()
	premium = list()
	voucher_items = list(
		"SL AL-655 Energy Rifle" = /obj/item/gun/energy/e_gun/hades,
		"NT-E-Rifle" = /obj/item/gun/energy/e_gun,
		"E-TAR SMG" = /obj/item/gun/energy/e_gun/smg,
		"E-SG 500" = /obj/item/gun/energy/e_gun/iot,
		"Combat Shotgun" = /obj/item/gun/ballistic/shotgun/automatic/combat,
		"Type U3 Uzi" = /obj/item/gun/ballistic/automatic/smg/mini_uzi,
		"M-90gl Carbine" = /obj/item/gun/ballistic/automatic/smg/m90,
		"sniper rifle" = /obj/item/gun/ballistic/automatic/marksman/sniper_rifle,
		"C-20r SMG" = /obj/item/gun/ballistic/automatic/smg/c20r,
		"Bulldog Shotgun" = /obj/item/gun/ballistic/shotgun/bulldog)

/obj/machinery/vending/security/marine/syndicate
	icon_state = "syndicate-marine"
	icon_deny = "syndicate-marine-deny"
	light_mask = "syndicate-marine-mask"
	icon_vend = "syndicate-marine-vend"
	req_access = list(ACCESS_SYNDICATE)
	products = list(
		/obj/item/restraints/handcuffs = 3,
		/obj/item/assembly/flash/handheld = 2,
		/obj/item/flashlight/seclite = 2,
		/obj/item/ammo_box/magazine/m10mm = 3,
		/obj/item/ammo_box/magazine/smgm45 = 3,
		/obj/item/ammo_box/magazine/sniper_rounds = 3,
		/obj/item/ammo_box/magazine/m556 = 2,
		/obj/item/ammo_box/magazine/m12g = 3,
		/obj/item/ammo_box/magazine/ebr = 5,
		/obj/item/grenade/c4 = 1,
		/obj/item/grenade/frag = 1,
		)
	voucher_items = list(
		"M-90gl Carbine" = /obj/item/gun/ballistic/automatic/smg/m90,
		"sniper rifle" = /obj/item/gun/ballistic/automatic/marksman/sniper_rifle,
		"C-20r SMG" = /obj/item/gun/ballistic/automatic/smg/c20r,
		"Bulldog Shotgun" = /obj/item/gun/ballistic/shotgun/bulldog)

/obj/machinery/vending/security/marine/nanotrasen
	icon_state = "nt-marine"
	icon_deny = "nt-marine-deny"
	light_mask = "nt-marine-mask"
	icon_vend = "nt-marine-vend"
	req_access = list(ACCESS_SECURITY)
	products = list(
		/obj/item/restraints/handcuffs = 10,
		/obj/item/assembly/flash/handheld = 10,
		/obj/item/flashlight/seclite = 10,

		/obj/item/screwdriver = 5,
		/obj/item/stock_parts/cell/gun = 10,
		/obj/item/stock_parts/cell/gun/upgraded = 5,

		/obj/item/grenade/c4 = 5,
		/obj/item/grenade/frag = 5,
		/obj/item/grenade/flashbang = 5,
		/obj/item/grenade/barrier = 10,
		)

	voucher_items = list(
		"SL AL-655 Energy Rifle" = /obj/item/gun/energy/e_gun/hades,
		"NT-E-Rifle" = /obj/item/gun/energy/e_gun,
		"E-TAR SMG" = /obj/item/gun/energy/e_gun/smg,
		"E-SG 500" = /obj/item/gun/energy/e_gun/iot)
/obj/item/gun_voucher
	name = "security weapon voucher"
	desc = "A token used to redeem guns from the SecTech vendor."
	icon = 'icons/obj/vending.dmi'
	icon_state = "sec-voucher"
	w_class = WEIGHT_CLASS_TINY //WS end

/obj/item/gun_voucher/syndicate
	name = "syndicate weapon voucher"
	desc = "A token used to redeem equipment from your nearest marine vendor."
	icon_state = "syndie-voucher"

/obj/item/gun_voucher/nanotrasen
	name = "nanotrasen weapon voucher"
	desc = "A token used to redeem equipment from your nearest marine vendor."
	icon_state = "nanotrasen-voucher"
