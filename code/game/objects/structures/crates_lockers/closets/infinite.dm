/obj/structure/closet/infinite
	name = "military locker"
	desc = "Ample storage space."
	max_integrity = 250
	armor = list("melee" = 30, "bullet" = 50, "laser" = 50, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	damage_deflection = 20

	var/replicating_type
	var/stop_replicating_at = 4
	var/auto_close_time = 0 //15 SECONDS // Set to 0 to disable auto-closing.

/obj/structure/closet/infinite/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/closet/infinite/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/closet/infinite/process()
	if(!replicating_type)
		if(!length(contents))
			return
		else
			replicating_type = contents[1].type

	if(replicating_type && !opened && (length(contents) < stop_replicating_at))
		new replicating_type(src)

/obj/structure/closet/infinite/open(mob/living/user, force = FALSE)
	. = ..()
	if(. && auto_close_time)
		addtimer(CALLBACK(src, PROC_REF(close_on_my_own)), auto_close_time, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/structure/closet/infinite/proc/close_on_my_own()
	if(close())
		visible_message("<span class='notice'>\The [src] closes on its own.</span>")


// 24.09.08 - CFW - infinite secure closets

/obj/structure/closet/secure_closet/infinite
	name = "secure military locker"
	desc = "Ample card-locked storage space."
	locked = TRUE
//	req_access = list(ACCESS_CENT_CAPTAIN)
	icon_state = "secure"
	max_integrity = 250
	armor = list("melee" = 30, "bullet" = 50, "laser" = 50, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	secure = TRUE
	damage_deflection = 20

	var/replicating_type
	var/stop_replicating_at = 4
	var/auto_close_time = 0 //15 SECONDS // Set to 0 to disable auto-closing.

/obj/structure/closet/secure_closet/infinite/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/closet/infinite/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/closet/secure_closet/infinite/process()
	if(!replicating_type)
		if(!length(contents))
			return
		else
			replicating_type = contents[1].type

	if(replicating_type && !opened && (length(contents) < stop_replicating_at))
		new replicating_type(src)

/obj/structure/closet/secure_closet/infinite/open(mob/living/user, force = FALSE)
	. = ..()
	if(. && auto_close_time)
		addtimer(CALLBACK(src, PROC_REF(close_on_my_own)), auto_close_time, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/structure/closet/secure_closet/infinite/proc/close_on_my_own()
	if(close())
		visible_message("<span class='notice'>\The [src] closes on its own.</span>")
