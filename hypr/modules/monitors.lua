-----------------
---- MONITORS ----
------------------

if HOSTNAME == "alpha" then
	hl.monitor({
		output = "",
		mode = "preferred",
		position = "auto",
		scale = 1.67,
	})
elseif HOSTNAME == "beta" then
	hl.monitor({
		output = "",
		mode = "preferred",
		position = "auto",
		scale = 1,
	})
end
